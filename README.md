![GameMaker](https://img.shields.io/badge/Made%20With-Godot%204-blue?style=for-the-badge&logo=godot-engine)
![Android](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android)
![Build](https://img.shields.io/github/actions/workflow/status/codetabsite/dursuntale/build-android.yml?style=for-the-badge&label=APK%20Build)

# Dursuntale

Undertale fan oyunu — Godot 4 versiyonu.

## Yapımcılar
- **Codetabsite*
- **Dursun Kebab*

## APK İndirme

Her commit sonrası GitHub Actions otomatik olarak APK üretir.

👉 [Actions sekmesinden APK indir](../../actions)

## Geliştirme

### Gereksinimler
- Godot Engine 4.3+
- Android SDK (APK build için)

### Proje Açma
1. Repoyu klonla
2. Godot 4'ü aç
3. `project.godot` dosyasını import et

## Build

APK otomatik olarak her `push`ta GitHub Actions ile build edilir.
Manuel build için:
```bash
godot --export-debug "Android" build/dursuntale.apk
```

## Lisans
Bu proje eğlence amaçlıdır.
