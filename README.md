# VIA Firmware (vi-VN)

## Log version

| Date       | Version                             | Note         |
|------------|-------------------------------------|--------------|
|2021-12-23  | Beta version                        |              |

## Upgrade Bootloader

Để sử dụng với VIA, việc upgrade bootloader dưới đây là bắt buộc. Hãy download file theo đúng version được ghi trên PCB.


| PCB        | Bootloader                          | Note         |
|------------|-------------------------------------|--------------|
| WE60 v2_0  | [we60_v2_0_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we60_v2_0_bootloader.zip)        | Required     |
| WE62 v2_6  | [we62_v2_6_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we62_v2_6_bootloader.zip)        | Required     |
| WE62 v2_6e | [we62_v2_6e_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we62_v2_6e_bootloader.zip)       | Required     |
| WE63 v2_6  | [we63_v2_6_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we63_v2_6_bootloader.zip)        | Required     |
| WE65 v2_0  | [we65_v2_0_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65_v2_0_bootloader.zip)        | Required     |
| WE65 v2_3  | [we65_v2_3_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65_v2_3_bootloader.zip)        | Required     |
| WE65 v2_5  | [we65_v2_5_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65_v2_5_bootloader.zip)        | Required     |
| WE65i v2_2 | [we65i_v2_2_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65i_v2_2_bootloader.zip)       | Required     |
| WE65i v2_5 | [we65i_v2_5_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65i_v2_5_bootloader.zip)       | Required     |
| WE65i v2_6 | [we65i_v2_6_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we65i_v2_6_bootloader.zip)       | Required     |
| WE67LITE   | [we67lite_2021oct_bootloader.zip](https://raw.githubusercontent.com/wekey-dev/firmware/master/bootloader/we67lite_2021oct_bootloader.zip) | Not Required |

Lưu ý: Sau khi upgrade bootloader, firmware cũ sẽ KHÔNG còn sử dụng được, KHÔNG nạp các phiên bản firmware được lấy từ config.wekey.dev

Nếu đã ugprade bootloader trước đó, hãy bỏ qua bước này.


### Install Python

* WINDOWN: https://realpython.com/installing-python/#how-to-install-python-on-windows
* MAC-OS:  https://realpython.com/installing-python/#how-to-install-python-on-macos
* LINUX: https://realpython.com/installing-python/#how-to-install-python-on-linux

### Install Pip3

* Xem hướng dẫn ở đây với OS tương ứng: https://pip.pypa.io/en/stable/installation/#get-pip-py

### Install adafruit-nrfutil

* Đối với MAC OS và LINUX

```bash
pip3 install --user adafruit-nrfutil
```


* Đối với WINDOWS, hãy download file dưới đây và giải nén được file adafruit-nrfutil.exe ra Desktop
https://github.com/adafruit/Adafruit_nRF52_nrfutil/releases/download/0.5.3.post17/adafruit-nrfutil--0.5.3.post17-win.zip

### Upgrade bootloader

* Nhấn đúp nút reset phía sau PCB để đưa PCB về trạng thái DFU (khi đó trên PC sẽ hiển thị một cổng USB có tên tương ứng với PCB)

#### LINUX

```bash
adafruit-nrfutil --verbose dfu serial --package [file_bootloader.zip] -p /dev/ttyACM0 -b 115200 --singlebank --touch 1200
```

Với [file_bootloader.zip] là tên của file bootloader đã download được ở bên trên. VD we65i_v2_6_bootloader.zip, ta sẽ có

```bash
cd ~/Download
```
```bash
adafruit-nrfutil --verbose dfu serial --package we65i_v2_6_bootloader.zip -p /dev/ttyACM0 -b 115200 --singlebank --touch 1200
```

#### MAC-OS

Sau khi PCB vào trạng thái DFU, dùng Termial để tìm port tương ứng

```bash
ls /dev/cu.*
```

Kết quả nhận được sẽ có dạng `/dev/cu.usbmodem...`, giả sử nhận được `/dev/cu.usbmodem411`

```bash
cd ~/Download
```
```bash
adafruit-nrfutil --verbose dfu serial --package we65i_v2_6_bootloader.zip -p /dev/cu.usbmodem411 -b 115200 --singlebank --touch 1200
```

Hãy thay `we65i_v2_6_bootloader.zip` và `/dev/cu.usbmodem411` bằng file và port tương ứng.

#### WINDOW

* Mở `Device Manager` của windows (có thể tìm thấy nó từ chức năng tìm kiếm trên cửa sổ Start, nhấn WIN sau đó gõ "Device Manager")
* Trên Device Manager, chú ý phần Ports, hãy expand để thấy rõ
* Tìm tên của PCB trên Ports, chú ý cổng COM có dạng `COMxx`, giả sử ở đây thu được là COM11
* Chuyển file `adafruit-nrfutil.exe` và `...bootloader.zip` tới màn hinh Desktop
* Mở `PowerShell` của windows (có thể tìm thấy từ chức năng tìm kiếm trên cửa sổ Start, nhấn WIN và sau đó gõ "PowerShell")

```bash
CD ~\Desktop
```
```bash
.\adafruit-nrfutil.exe --verbose dfu serial --package we65i_v2_6_bootloader.zip --port COM11 -b 115200 --singlebank --touch 1200
```

Hãy thay `we65i_v2_6_bootloader.zip` và `COM11` bằng file và cổng COM tương ứng.


## Firmware for VIA

| PCB        | Bootloader                   | VIA JSON                  |
|------------|------------------------------|---------------------------|
| WE60 v2_0  | [we60_v2_0_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we60_v2_0_via.uf2)        | [we60_v2_0.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we60_v2_0.json)        |
| WE62 v2_6  | [we62_v2_6_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we62_v2_6_via.uf2)        | [we62_v2_6.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we62_v2_6.json)        |
| WE62 v2_6e | [we62_v2_6e_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we62_v2_6e_via.uf2)       | [we62e_v2_6.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we62e_v2_6.json)       |
| WE63 v2_6  | [we63_v2_6_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we63_v2_6_via.uf2)        | [we63_v2_6.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we63_v2_6.json)        |
| WE65 v2_0  | [we65_v2_0_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65_v2_0_via.uf2)        | [we65_v2_0.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65_v2_0.json)        |
| WE65 v2_3  | [we65_v2_3_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65_v2_3_via.uf2)        | [we65_v2_3.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65_v2_3.json)        |
| WE65 v2_5  | [we65_v2_5_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65_v2_5_via.uf2)        | [we65_v2_5.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65_v2_5.json)        |
| WE65i v2_2 | [we65i_v2_2_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65i_v2_2_via.uf2)       | [we65i_v2_2.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65i_v2_2.json)       |
| WE65i v2_5 | [we65i_v2_5_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65i_v2_5_via.uf2)       | [we65i_v2_5.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65i_v2_5.json)       |
| WE65i v2_6 | [we65i_v2_6_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we65i_v2_6_via.uf2)       | [we65i_v2_6.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we65i_v2_6.json)       |
| WE67LITE   | [we67lite_2021oct_via.uf2](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_firmware/we67lite_2021oct_via.uf2) | [we67lite_2021oct.json](https://raw.githubusercontent.com/wekey-dev/firmware/master/via_json/we67lite_2021oct.json) |


## Flash firmware

* Kết nối PCB vào PC sau đó chuyển PCB về DFU Mode bằng cách nhấn đúp (nhấn 2 lần liên tiếp) nút RESET nằm trên PCB. 
* Khi ở DFU Mode, PC sẽ hiển thị một cổng usb với tên PCB tương ứng (Nếu trên PC đã thấy cổng usb này, thì PCB đã ở trạng thái DFU mode).
* Kéo thả (hoặc copy/paste) file firmware (có đuôi .uf2) đã download được ở bên trên (Hãy chọn file phù hợp với version).

## VIA

* Trên ứng dụng VIA, vào tab "SETTINGS", Enable "Show Design tab", nếu Design tab đã được enable, bỏ qua bước này.
* Vào tab "DESIGN", Click "Load" và chọn file JSON tương ứng với PCB đã download ở trên.
* Quay trở lại tab "CONFIGURE" và thực hiện keymap cho phím.

## Keymap

Các keycode cho PCB nằm ở mục "CUSTOM" của KEYMAP. Sau đây là mô tả về các keycode:

| Keycode      | Mô tả                                                                                                                                                                                                                          |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| USB          | Chuyển kết nối USB                                                                                                                                                                                                             |
| BLE1         | Chuyển kết nối BLE, thiết bị 1.<br>Nhấn giữ 3 giây để tạo kết nối mới                                                                                                                                                          |
| BLE2         | Chuyển kết nối BLE, thiết bị 2.<br>Nhấn giữ 3 giây để tạo kết nối mới                                                                                                                                                          |
| BLE3         | Chuyển kết nối BLE, thiết bị 3.<br>Nhấn giữ 3 giây để tạo kết nối mới                                                                                                                                                          |
| RF           | Chuyển kết nối RF                                                                                                                                                                                                              |
| BLE RST      | Xóa ghi nhớ các thiết bị đã ghép nối BLE                                                                                                                                                                                       |
| PRT BAT      | Gửi % của pin còn lại<br>(Chỉ gửi cho thiết bị kết nối BLE)                                                                                                                                                                    |
| SLEEP        | Đưa bàn phím vào trạng thái ngủ                                                                                                                                                                                                |
| TOG IND      | Tắt/Mở đèn báo                                                                                                                                                                                                                 |
| WAKEUP SETUP | Cài đặt phím gọi từ trạng thái ngủ.<br>- Nhấn phím này 1 lần, bàn phím sẽ vào trạng thái cài đặt.<br>- Hãy nhấn 1 phím được chọn làm phím gọi dậy<br>- Trạng thái cài đặt sẽ tự động thoát và vị trí phím gọi dậy được lưu lại |
| WAKEUP RST   | Xóa bỏ phím gọi, <br>khi không phím gọi dậy được chỉ định, <br>mặc định bàn phím được gọi dậy bằng cách nhấn 1 phím bất kỳ                                                                                                     |
| RESTART      | Khởi động lại bàn phím                                                                                                                                                                                                         |
| SLP UP       | Tăng thời gian chờ trước khi tự động vào trạng thái ngủ lên 10 phút                                                                                                                                                            |
| SLP DOWN     | Giảm thời gian chờ trước khi tự động vào trạng thái ngủ xuống 10 phút                                                                                                                                                          |
| SLP DEFAULT  | Đặt lại thời gian chờ trước khi vào trạng thía ngủ về mặt định (10 phút)                                                                                                                                                       |
| INFO         | Gửi thông tin thời gian chờ sang thiết bị đang kết nối với phím<br>(chỉ gửi qua BLE)                                                                                                                                           |





