# AppTransfer 📱➡️📱

Application Android pour transférer des applications avec leurs données d'un Samsung vers un autre, puis les supprimer de l'appareil source.

## Fonctionnalités
- ✅ Liste toutes les applications installées avec icône, taille
- ✅ Sélection multiple d'applications à transférer
- ✅ Transfert via WiFi Direct (sans internet, sans câble)
- ✅ Mode envoi et réception
- ✅ Progression en temps réel avec notification
- ✅ Désinstallation optionnelle après transfert
- ✅ Demande toutes les permissions nécessaires avec explications

## Permissions demandées
| Permission | Raison |
|---|---|
| Localisation | Obligatoire Android pour WiFi Direct/Bluetooth |
| Bluetooth | Découverte des appareils à proximité |
| Stockage complet | Lire les fichiers APK |
| Installer des apps | Installer les APK reçus |
| Notifications | Progression en arrière-plan |

## Comment compiler

### Méthode 1 — Android Studio (recommandé)
1. Télécharger [Android Studio](https://developer.android.com/studio)
2. `File > Open` → sélectionner le dossier `AppTransfer`
3. Attendre la synchronisation Gradle (téléchargement automatique)
4. `Build > Build Bundle(s) / APK(s) > Build APK(s)`
5. L'APK se trouve dans `app/build/outputs/apk/debug/`

### Méthode 2 — Ligne de commande
```bash
# Nécessite Android SDK installé
export ANDROID_HOME=/path/to/your/android/sdk
./gradlew assembleDebug
# APK généré : app/build/outputs/apk/debug/app-debug.apk
```

## Installation sur Samsung
```bash
adb install app/build/outputs/apk/debug/app-debug.apk
```
Ou copier l'APK sur le téléphone et l'ouvrir avec un gestionnaire de fichiers.

## Architecture
```
MainActivity          → Vérification et redirection permissions
PermissionsActivity   → Écran d'explication et demande des permissions  
AppListActivity       → Liste des apps installées, sélection
TransferActivity      → Découverte WiFi Direct, connexion, transfert
TransferService       → Service background : envoi/réception socket TCP
PermissionItemView    → Widget custom pour chaque permission
```

## Notes techniques
- SDK minimum : Android 7.0 (API 24)
- SDK cible : Android 14 (API 34)
- Transfert via socket TCP sur WiFi Direct (port 8988)
- Les APK reçus sont stockés dans `Android/data/com.apptransfer/files/received_apps/`
- La désinstallation utilise `Intent.ACTION_DELETE` (confirmation utilisateur)
