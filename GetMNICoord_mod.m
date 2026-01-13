function [MNICoordinates] = GetMNICoord(InverseDeformationField, NativeCoords)

% Get voxel to mm transformation matrix:
M = spm_get_space(InverseDeformationField);

% Initialize an array to store the MNI coordinates
MNICoordinates = zeros(size(NativeCoords, 1), 3);

% Loop over each coordinate
for i = 1:size(NativeCoords, 1)
    % Make Native coordinate a 4D column vector:
    NativeCoordmm = NativeCoords(i, :)';
    NativeCoordmm = [NativeCoordmm(1:3); 1];

    % Get Native coordinate in voxel space
    NativeCoordvox = M \ NativeCoordmm;

    % Round to nearest integer voxel:
    NativeCoordvox = round(NativeCoordvox);

    for dim = 1:3
        MNICoordinates(i, dim) = spm_sample_vol(spm_vol([InverseDeformationField ',1,' num2str(dim)]), NativeCoordvox(1), NativeCoordvox(2), NativeCoordvox(3), 0);
    end

    % Display the MNI coordinates
    fprintf('MNI Coordinates for Native Coord %d: [%.2f, %.2f, %.2f]\n', i, MNICoordinates(i, 1), MNICoordinates(i, 2), MNICoordinates(i, 3));
end

end
