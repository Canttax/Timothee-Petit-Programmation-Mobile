# Contributing Guide - Organizing TPs

This guide explains how to organize and add new TPs to this repository.

## Adding a New TP

1. **Create a new directory** following the naming convention:
   ```
   TP[number]-[short-descriptive-name]
   ```
   Example: `TP1-hello-world-app`, `TP2-todo-list`, `TP3-weather-app`

2. **Use the template structure**:
   - Copy the `TP-Template` directory
   - Rename it according to your TP
   - Fill in the README.md with your TP details

3. **Organize your code**:
   ```
   TP[number]-[name]/
   ├── README.md          # TP description (required)
   ├── src/              # Source code (required)
   ├── docs/             # Additional documentation (optional)
   └── assets/           # Resources (optional)
   ```

4. **Update the main README**:
   - Add your TP to the "TPs List" section
   - Include a brief description

## Directory Structure Guidelines

### src/
Contains all source code for the TP. Structure depends on the technology:

**Android (Java/Kotlin):**
```
src/
├── main/
│   ├── java/
│   ├── res/
│   └── AndroidManifest.xml
└── test/
```

**iOS (Swift):**
```
src/
├── [AppName]/
│   ├── Models/
│   ├── Views/
│   ├── Controllers/
│   └── Assets.xcassets/
└── [AppName]Tests/
```

**React Native:**
```
src/
├── components/
├── screens/
├── navigation/
├── services/
└── App.js
```

**Flutter:**
```
src/
├── lib/
│   ├── models/
│   ├── screens/
│   ├── widgets/
│   └── main.dart
└── test/
```

### docs/
Optional directory for additional documentation:
- Architecture diagrams
- API documentation
- User guides
- Screenshots

### assets/
Optional directory for resources:
- Images
- Icons
- Fonts
- Data files
- Mock data

## Commit Message Guidelines

Use clear and descriptive commit messages:
- `feat(TP1): add user authentication`
- `fix(TP2): resolve navigation bug`
- `docs(TP3): update README with screenshots`
- `refactor(TP1): improve code structure`

## Best Practices

1. **Documentation**: Always include a comprehensive README for each TP
2. **Code Quality**: Follow language-specific style guides
3. **Version Control**: Commit regularly with meaningful messages
4. **Screenshots**: Include visual documentation when applicable
5. **Dependencies**: Document all dependencies and how to install them
6. **Testing**: Include tests when required by the TP
7. **.gitignore**: Don't commit build artifacts, dependencies, or IDE files

## TP Naming Conventions

- Use lowercase for directory names
- Separate words with hyphens
- Keep names concise but descriptive
- Example: `TP1-calculator`, `TP2-weather-app`, `TP3-social-media-clone`

## Questions?

If you have questions about organizing your TPs, refer to:
- The `TP-Template` directory for structure examples
- Existing TPs in the repository
- Course documentation
