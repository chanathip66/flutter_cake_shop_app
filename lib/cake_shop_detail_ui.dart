import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'cake_shop_list_ui.dart';

class CakeShopDetailUi extends StatelessWidget {
  const CakeShopDetailUi({
    super.key,
    required this.shop,
  });

  final CakeShop shop;

  @override
  Widget build(BuildContext context) {
    final lat = double.tryParse(shop.latitude) ?? 13.736717;
    final lng = double.tryParse(shop.longitude) ?? 100.523186;
    final point = LatLng(lat, lng);

    return Scaffold(
      backgroundColor: const Color(0xFFE6E1E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFA3B33),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white, size: 22),
        title: Text(
          shop.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _RoundedImage(
                  imagePath: shop.image1,
                  width: 130,
                  height: 78,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RoundedImage(
                    imagePath: shop.image2,
                    width: 128,
                    height: 82,
                  ),
                  const SizedBox(width: 12),
                  _RoundedImage(
                    imagePath: shop.image3,
                    width: 128,
                    height: 82,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'ชื่อร้าน 🏬',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                shop.name,
                style: const TextStyle(fontSize: 13, color: Color(0xFF2E2E2E)),
              ),
              const SizedBox(height: 14),
              const Text(
                'เวลาเปิดปิด ⏰',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                shop.openCloseTime,
                style: const TextStyle(fontSize: 13, color: Color(0xFF2E2E2E)),
              ),
              const SizedBox(height: 14),
              const Text(
                'รายละเอียดของร้าน 🧁',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                shop.description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2E2E2E),
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'ที่อยู่ของร้าน 🚩',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                shop.address,
                style: const TextStyle(fontSize: 13, color: Color(0xFF2E2E2E)),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.phone, color: Color(0xFF225B2A), size: 14),
                      const SizedBox(width: 7),
                      Text(
                        shop.phone.trim(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              _SocialRow(
                icon: Icons.language,
                iconColor: const Color(0xFFF2C200),
                text: shop.website,
              ),
              const SizedBox(height: 8),
              _SocialRow(
                icon: Icons.facebook,
                iconColor: const Color(0xFF2E6DEB),
                text: shop.facebook,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: point,
                      initialZoom: 15,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'com.example.flutter_cake_shop_app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: point,
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundedImage extends StatelessWidget {
  const _RoundedImage({
    required this.imagePath,
    required this.width,
    required this.height,
  });

  final String imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: width,
          height: height,
          color: const Color(0xFFD7D0D8),
          alignment: Alignment.center,
          child: const Icon(Icons.image_not_supported, color: Color(0xFF6E6870)),
        ),
      ),
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 23),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF2D2D2D),
              height: 1.25,
            ),
          ),
        ),
        const Icon(Icons.link, size: 18, color: Color(0xFF333333)),
      ],
    );
  }
}
