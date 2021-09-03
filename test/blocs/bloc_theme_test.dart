
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/blocs/bloc_theme.dart';

void main() {

    test('load theme', (){
        expect(BlocTheme().defaultMaterialColor is MaterialColor, true);
        expect(BlocTheme().size is Size == true, true);
    });

}