# 🗨️ Diyalog Ekleme Rehberi

## Hızlı Başlangıç

`scripts/NPC.gd` dosyasındaki `DIALOGS` sözlüğüne yeni diyalog ekle:

```gdscript
const DIALOGS: Dictionary = {
    "benim_npcim": [
        {"text": "* Merhaba!", "face": "toriel"},
        {"text": "* Nasılsın?",  "face": "toriel"},
        {"text": "* Güle güle!", "face": "none"},
    ],
}
```

## Diyalog Satırı Seçenekleri

| Alan | Açıklama | Örnek |
|------|----------|-------|
| `text` | Gösterilecek metin | `"* Merhaba!"` |
| `face` | Yüz görseli | `"toriel"`, `"sans"`, `"none"` |

## Metin Özel Kodlar

| Kod | Anlamı |
|-----|--------|
| `\n` | Yeni satır |
| `*`  | Undertale tarzı diyalog başı |

## NPC Sahneye Ekleme

1. Godot'ta yeni Node2D oluştur → `NPC.gd` scripti ekle
2. Inspector'dan `npc_id` = `"benim_npcim"` yaz
3. Alt node ekle: `Area2D` → `CollisionShape2D` (CircleShape2D, radius 40)
4. Karakteri bu alana sokunca Z/Enter'a basınca diyalog açılır

## Mevcut Yüzler

Yüz görseli eklemek için: `res://faces/` klasörüne PNG koy, isim = anahtar
- `toriel` → `faces/toriel.png`
- `sans`   → `faces/sans.png`
- `papyrus`→ `faces/papyrus.png`
- `flowey` → `faces/flowey.png`
- `none`   → yüz gösterilmez

## Diyalog Kodu'ndan Tetikleme

Herhangi bir script'ten:
```gdscript
DialogBox.show_dialog([
    {"text": "* Bu bir test!"},
    {"text": "* İkinci satır."},
])
```
