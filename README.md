# FormPeak

**Stack:** Swift 5 · UIKit · iOS 17

`FormPeak` — is a personal training and records tracker for people who regularly do strength training, CrossFit, or running and want to see their progress more consciously. It helps plan workloads, log workouts in a calendar, record personal bests, and track stats and goals in a clean, visual interface.

## Getting started

#### 1. Make sure you have installed
- `Xcode` 
- `Homebrew`
- `XcodeGen` — generates `.xcodeproj` from `project.yml`
- `SwiftLint` — lints code style during builds

#### If Homebrew is missing:
``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Install XcodeGen and SwiftLint
``` bash
brew install xcodegen swiftlint
```

#### Verify installation:
``` bash
xcodegen --version
swiftlint version
```

#### 3. Clone the repository
``` bash
git clone https://github.com/artkriukov/FormPeak.git
cd FormPeak
```

#### 4. Generate the Xcode project
The project is described in `project.yml`, so first generate the `.xcodeproj`:
``` bash
xcodegen generate
```
After this step, `FormPeak.xcodeproj` will appear in the repo root.

#### 5. Open in Xcode
``` bash
open FormPeak.xcodeproj
```

#### 6. Build and run
Press `Cmd+R`.

---

## Shown concepts

### Architecture concepts

- Modular iOS project structure
- Dependency Injection
- MVVM / Coordinators

### Other concepts

- XcodeGen project generation
- SwiftLint integration
- R.swift for type-safe resources
- Dynamic Type support with semantic typography tokens

## Docs

- [Branching rules](docs/branching.md)
- [Commit rules](docs/commits.md)
