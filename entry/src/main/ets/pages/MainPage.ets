import { MainConstant, WEB_PAGE_URI, LOCAL_PATH, CLOUD_PATH } from '../common/Constant';

@Extend(Button) function fancy (top: string) {
  .fontSize(MainConstant.BUTTON_FONT_SIZE)
  .fontColor($r('app.color.start_window_background'))
  .width(MainConstant.BUTTON_WIDTH)
  .height(MainConstant.BUTTON_HEIGHT)
  .margin({ top: top })
  .backgroundColor($r('app.color.blue'))
  .borderRadius(MainConstant.BUTTON_BORDER_RADIUS)
}

@Entry
@Component
struct MainPage{

  build(){
    Column(){
      Navigator({
        target: WEB_PAGE_URI,
        type: NavigationType.Push
      }){
        Button($r('app.string.loadLocalH5'))
          .fancy(MainConstant.BUTTON_MARGIN_TOP)
      }
      .params({
        path: LOCAL_PATH,
        tips: $r('app.string.local')
      })
    }
    .width('100%')
    .height(MainConstant.FULL_HEIGHT)
    .backgroundImage($r('app.media.background'))
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}