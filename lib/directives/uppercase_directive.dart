library attribute_directives.uppercase_directive;

import 'dart:async';
import 'dart:html' as html;
import 'package:angular2/core.dart';

@Directive(selector: '[foUppercase]')
class UppercaseDirective implements OnInit
{
  UppercaseDirective(this._er);

  void ngOnInit()
  {
    html.Element nativeElement = _er.nativeElement;
    _input = nativeElement.querySelector("input");
  }


  @HostListener('keyup', const ['\$event'])
  void onInput(html.KeyboardEvent e)
  {
    if (_skipCodes.contains(e.keyCode)) return;
    new Timer(const Duration(milliseconds: 50), ()
    {
      _input.value = _input.value.toUpperCase();
      _input.dispatchEvent(new html.Event("input"));
    });
  }

  @HostListener('blur')
  void onBlur()
  {
    _input.value = _input.value.toUpperCase();
    _input.dispatchEvent(new html.Event("input"));
  }

  final List<html.KeyCode> _skipCodes =
  [
    html.KeyCode.SHIFT,
    html.KeyCode.CTRL,
    html.KeyCode.HOME,
    html.KeyCode.END,
    html.KeyCode.LEFT,
    html.KeyCode.RIGHT,
    html.KeyCode.TAB,
    html.KeyCode.BACKSPACE,
    html.KeyCode.DELETE
  ];

  final ElementRef _er;
  html.InputElement _input;


}