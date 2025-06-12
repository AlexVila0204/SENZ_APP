import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double sensitivity = 50.0;
  bool batteryAlerts = true;
  bool appUpdates = true;
  bool tips = false;
  bool darkMode = false;
  bool saveTranslations = true;
  
  String primaryLanguage = "Español";
  String secondaryLanguage = "Inglés";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Color(0xFF2563EB),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Configuración',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Language Preferences Section
                _SectionContainer(
                  title: 'Preferencias de idioma',
                  child: Column(
                    children: [
                      _LanguageRow(
                        'Idioma principal',
                        'Idioma de salida predeterminado',
                        primaryLanguage,
                        () => _showLanguageSelector('primary'),
                      ),
                      const SizedBox(height: 12),
                      _LanguageRow(
                        'Idioma secundario',
                        'Para traducciones alternativas',
                        secondaryLanguage,
                        () => _showLanguageSelector('secondary'),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Glove Configuration Section
                _SectionContainer(
                  title: 'Configuración del guante',
                  child: Column(
                    children: [
                      _SensitivityRow(),
                      const SizedBox(height: 12),
                      _CalibrationRow(),
                      const SizedBox(height: 12),
                      _BatteryRow(),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Notifications Section
                _SectionContainer(
                  title: 'Notificaciones',
                  child: Column(
                    children: [
                      _SwitchRow(
                        'Alertas de batería baja',
                        batteryAlerts,
                        (value) => setState(() => batteryAlerts = value),
                      ),
                      const SizedBox(height: 12),
                      _SwitchRow(
                        'Actualizaciones de la app',
                        appUpdates,
                        (value) => setState(() => appUpdates = value),
                      ),
                      const SizedBox(height: 12),
                      _SwitchRow(
                        'Consejos y trucos',
                        tips,
                        (value) => setState(() => tips = value),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // App Settings Section
                _SectionContainer(
                  title: 'Aplicación',
                  child: Column(
                    children: [
                      _SwitchRow(
                        'Tema oscuro',
                        darkMode,
                        (value) => setState(() => darkMode = value),
                      ),
                      const SizedBox(height: 12),
                      _SwitchRow(
                        'Guardar traducciones',
                        saveTranslations,
                        (value) => setState(() => saveTranslations = value),
                      ),
                      const SizedBox(height: 12),
                      _InfoRow('Versión de la app', '2.1.3'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Cerrar sesión',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _SectionContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
  
  Widget _LanguageRow(String title, String subtitle, String selected, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                selected,
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blue[600],
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _SensitivityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sensibilidad',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Ajusta la sensibilidad del sensor',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 100,
          child: Slider(
            value: sensitivity,
            min: 1,
            max: 100,
            divisions: 99,
            activeColor: Colors.blue[600],
            onChanged: (value) {
              setState(() {
                sensitivity = value;
              });
            },
          ),
        ),
      ],
    );
  }
  
  Widget _CalibrationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calibración',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Calibra el guante para mayor precisión',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Start calibration
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          ),
          child: Text(
            'Calibrar',
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _BatteryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Batería',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Estado actual de la batería',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 48,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 32,
                    height: 16,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '75%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _SwitchRow(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue[600],
        ),
      ],
    );
  }
  
  Widget _InfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  
  void _showLanguageSelector(String type) {
    final languages = ["Español", "Inglés", "Francés", "Alemán"];
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Seleccionar idioma',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...languages.map((language) => ListTile(
              title: Text(language),
              onTap: () {
                setState(() {
                  if (type == 'primary') {
                    primaryLanguage = language;
                  } else {
                    secondaryLanguage = language;
                  }
                });
                Navigator.pop(context);
              },
            )).toList(),
          ],
        ),
      ),
    );
  }
  
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement logout logic
            },
            child: Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red[600]),
            ),
          ),
        ],
      ),
    );
  }
}
