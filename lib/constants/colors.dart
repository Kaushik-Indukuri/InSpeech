import 'package:flutter/material.dart';

const Color background = Color(0xFF211e2f);
const Color lightbackground = Color(0xffE0E0E0);
const Color darkBackground = Color(0xFF191524);
const Color secondaryBackground = Color(0xFF272335);
const Color thirdBackground = Color(0xFF322f42);
const Color secondaryText = Color(0xFF7d7a8b);
const Color blueText = Color(0xFF51abd4);
const Color darkBlue = Color(0xFF2986a4);
const Color gradientGreen = Color(0xFF34ae97);
const Color paletteBlue = Color(0xFF50a7b4);
const Color paletteGreen = Color(0xFF0d3333);
const Color grey = Colors.blueGrey;
const Color darktext = Color(0xff171636);

Gradient blueGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.lightBlue[300],
      Colors.lightBlue[400],
      Colors.lightBlue[500]
    ],
    stops: [
      0.4, 0.6, 1
    ]
);

Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF34ae97),
      Color(0xFF2986a4),
    ],
    stops: [
      0.2, 0.7
    ]
);

Gradient buttonGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF36b29b),
      Color(0xFF2b89a8),
    ],
    stops: [
      0.3, 0.7
    ]
);

Gradient darkblueGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF1e3c72).withOpacity(0.75),
      Color(0xFF1e3c72),
    ],
    stops: [
      0.1, 1.5,
    ]
);

Gradient greyGradient = LinearGradient(
    colors: [
      const Color(0x36FFFFFF),
      const Color(0x0FFFFFFF)
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight
);

Gradient greyMessage = LinearGradient(
  colors: [
    const Color(0xFFc7c7c7),
    const Color(0xFFc7c7c7)
  ],
);

Gradient blueMessage = LinearGradient(
    colors: [
      const Color(0xFF3895cf),
      const Color(0xFF38a4cf)
    ],
    begin: FractionalOffset.centerLeft,
    end: FractionalOffset.centerRight,
    stops: [
      0.4, 1,
    ]
);