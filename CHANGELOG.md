# Changelog

All notable changes to the GBADs Disease Productivity Model (DPM) will be documented in this file.

## [5.0.0] - 2026-01-14

- Adding documentation including readme and license
- Merge pull request #1 from GBADsInformatics/docs/readme-license
- Remove "species" at line 12 (now extracted from the template directly)
- Modified to extract the species from the input table directly to facilitate testing
- Fixed bug in output variable Num_offtake for juveniles Added output variable Offtake liveweight for juveniles Modified code to sample start population size from either a distribution or a point estimate (instead of a point estimate only) Removed outdated comments Modified code to use distribute for Gamma parameters in cattle and equids. This also if works if parameter is provided as point estimate, as in Jemburu et al. (2025)
- Merge pull request #2 from GBADsInformatics/feat/version5

## [4.0.0] - 2025-12-19

- Adding all files for initial commit - versioning release 4.0 of the model
