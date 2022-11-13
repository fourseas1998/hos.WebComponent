import router from '@ohos.router';
import { WebConstant, MainConstant, WEB_ALERT_DIALOG_TEXT_VALUE } from '../common/Constant';

@Entry
@Component
struct WebPage{
  @State params: object = router.getParams();
  webController: WebController = new WebController();

  build() {
    Stack({
      alignContent: Alignment.TopStart
    }) {
      Column() {
        //顶部栏
        Row() {
          Image($rawfile('img/ic_public_back.png'))
            .width(WebConstant.IMAGE_WIDTH)
            .height(WebConstant.IMAGE_HEIGHT)
            .margin({ left: WebConstant.IMAGE_MARGIN_LEFT })
            .onClick(() => {
              router.back()
            })
          Text($r('app.string.prompts'))
            .fontSize(WebConstant.TOP_TEXT_FONT_SIZE)
            .width(WebConstant.TOP_TEXT_WIDTH)
            .height(WebConstant.TOP_TEXT_HEIGHT)
            .fontColor($r('app.color.black'))
            .margin({ left: WebConstant.TOP_TEXT_MARGIN_LEFT })

        }.height(WebConstant.TOP_ROW_HEIGHT)

        //web组件加载本地H5
        Web({ src: this.params['path'], controller: this.webController })
          .width(WebConstant.WIDTH)
          .margin({
            left: WebConstant.MARGIN_LEFT,
            right: WebConstant.MARGIN_RIGHT,
            top: WebConstant.MARGIN_TOP
          })
          .zoomAccess(false)
          .aspectRatio(1)
          .onConfirm((event) => {
            AlertDialog.show({
              message: `${WEB_ALERT_DIALOG_TEXT_VALUE}` + `${event.message}`,
              confirm: {
                value: $r('app.string.web_alert_dialog_button_value'),
                action: () => {
                  //确认
                  event.result.handleConfirm();
                }
              },
              cancel: () => {
                //取消
                event.result.handleCancel();
              }
            });
            return true;
          })

        //
        Column() {
          Text($r('app.string.textValue'))
            .fontSize(WebConstant.TEXT_VALUE_FONT_SIZE)
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.text_value_font_color'))
            .width(WebConstant.TEXT_VALUE_WIDTH)
            .height(WebConstant.TEXT_VALUE_HEIGHT)
            .fontWeight(WebConstant.TEXT_VALUE_FONT_WEIGHT)
            .margin({ top: WebConstant.TEXT_VALUE_MARGIN_TOP })
          Text(this.params['tips'])
            .fontSize(WebConstant.TIP_TEXT_VALUE_FONT_SIZE)
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.text_value_font_color'))
            .width(WebConstant.TIP_TEXT_VALUE_WIDTH)
            .height(WebConstant.TIP_TEXT_VALUE_HEIGHT)
            .opacity(WebConstant.TIP_TEXT_VALUE_OPACITY)
            .margin({ top: WebConstant.TIP_TEXT_VALUE_MARGIN_TOP })
        }

        //按钮
        Button($r('app.string.btnValue'))
          .width(WebConstant.BUTTON_WIDTH)
          .height(WebConstant.BUTTON_HEIGHT)
          .margin({ top: WebConstant.BUTTON_MARGIN_TOP })
          .fontSize(WebConstant.BUTTON_FONT_SIZE)
          .fontColor($r('app.color.start_window_background'))
          .backgroundColor($r('app.color.blue'))
          .borderRadius(WebConstant.BUTTON_BORDER_RADIUS)
          .onClick(() => {
            this.webController.runJavaScript({ script: 'startDraw()' });
          })
      }
      .width(WebConstant.FULL_WIDTH)
      .height(WebConstant.FULL_HEIGHT)
    }
    .width(WebConstant.FULL_WIDTH)
    .height(WebConstant.FULL_HEIGHT)
    .backgroundImage($r('app.media.background'))
  }
}