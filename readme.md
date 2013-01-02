ITG.WinAPI.User32
=================

Обёртки для Windows API User32.dll и командлеты на их основе.

Версия модуля: **2.0**

Функции модуля
--------------

### WindowForeground

#### Обзор [Set-WindowForeground][]

Устанавливает фокус ввода на окно.

	Set-WindowForeground [-HWnd] <IntPtr> [-PassThru] <CommonParameters>

Подробнее - [Set-WindowForeground][].

### WindowZOrder

#### Обзор [Set-WindowZOrder][]

Устанавливает положение окна по оси Z.

	Set-WindowZOrder [-HWnd] <IntPtr> [-ZOrder] [-PassThru] <CommonParameters>

Подробнее - [Set-WindowZOrder][].

Подробное описание функций модуля
---------------------------------

#### Set-WindowForeground

Устанавливает фокус ввода на окно.
      Обёртка для API SetForegroundWindow.

##### Синтаксис

	Set-WindowForeground [-HWnd] <IntPtr> [-PassThru] <CommonParameters>

##### Параметры

- `HWnd <IntPtr>`
        дескриптор окна

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByValue, ByPropertyName)
        Принимать подстановочные знаки?

- `PassThru [<SwitchParameter>]`

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `<CommonParameters>`
        Данный командлет поддерживает общие параметры: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer и OutVariable. Для получения дополнительных сведений введите
        "get-help [about_CommonParameters][]".



##### Примеры использования

1. Пример 1.

		$ie.HWND | Set-WindowZOrder -PassThru | Set-WindowForeground

#### Set-WindowZOrder

Устанавливает положение окна по оси Z.
      Обёртка для API SetWindowPos.

##### Синтаксис

	Set-WindowZOrder [-HWnd] <IntPtr> [-ZOrder] [-PassThru] <CommonParameters>

##### Параметры

- `HWnd <IntPtr>`
        дескриптор окна

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByValue, ByPropertyName)
        Принимать подстановочные знаки?

- `ZOrder`
        желаемое положение окна по оси Z

        Требуется? true
        Позиция? 2
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `PassThru [<SwitchParameter>]`

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `<CommonParameters>`
        Данный командлет поддерживает общие параметры: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer и OutVariable. Для получения дополнительных сведений введите
        "get-help [about_CommonParameters][]".



##### Примеры использования

1. Пример 1.

		$ie.HWND | Set-WindowZOrder -PassThru | Set-WindowForeground


[about_CommonParameters]: http://go.microsoft.com/fwlink/?LinkID=113216 "Описание параметров, которые могут использоваться с любым командлетом."
[Set-WindowForeground]: <ITG.WinAPI.User32#Set-WindowForeground> "Устанавливает фокус ввода на окно."
[Set-WindowZOrder]: <ITG.WinAPI.User32#Set-WindowZOrder> "Устанавливает положение окна по оси Z."

---------------------------------------

Генератор: [ITG.Readme](http://github.com/IT-Service/ITG.Readme "Модуль PowerShell для генерации readme для модулей PowerShell").

