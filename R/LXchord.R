
LXchord <- function(data_set){

  all_packages <- data.frame(installed.packages())

  pack <- data.frame(c("openxlsx","dplyr","stringr","circlize","Cairo"))

  bioc_pack <- data.frame(c("limma"))

  pack$type <- pack[,1] %in% all_packages$Package

  for (i in 1:nrow(pack)){if (!requireNamespace(pack[i,1], quietly=TRUE))
    install.packages(pack[i,1],update = F,ask = F)}
  rm(i)

  for (i in 1:nrow(bioc_pack)){if (!requireNamespace(bioc_pack[i,1], quietly=TRUE))
    BiocManager::install (bioc_pack[i,1],update = F,ask = F) }

  rm(i)

  packages <- c(pack[,1],bioc_pack[,1])

  for(i in packages){
    library(i, character.only = T)}

  rm(i)

#---------------------------------------------------------------------------

data_set <- read.xlsx(data_set,rowNames = T) %>%
       as.matrix()

#chordDiagram(data_set)
#circos.clear()  #养成绘制和弦图后清除前面绘图痕迹的习惯

#设置颜色：
#col <- c(pathway1='#E61E18',pathway2='#EEE940',pathway3='#78B837',pathway4='#71B7C1',pathway5='#33538E',pathway6='#9F5D92',
#         gene1_num = 'grey50',gene2_num = 'grey50',gene3_num = 'grey50',gene4_num = 'grey50',gene5_num = 'grey50',
#         gene6_num = 'grey50',gene7_num = 'grey50',gene8_num = 'grey50')

#设置角度：
# circos.par(start.degree = 90)

#细节修改：
# chordDiagram(data_set,
#            # grid.col = col,
#             transparency = 0,
#             link.lwd = 1.8,
#             link.lty = 1,
#             link.border = "black",
#             grid.border = 'black',
#             big.gap = 10, #最大间隙
#             annotationTrack = c("name", "grid")) #显示name、grid圈，不显示坐标轴圈
# circos.clear()

# 标签一圈呈放射状
circos.par(start.degree = 90)

# Cairo::CairoPNG(
#       filename = "Chord diagram.png", # 文件名称
#       width = 1000,           # 宽
#       height = 800,          # 高
#       units = "px",        # 单位
#       dpi = 150)           # 分辨率

chordDiagram(data_set,
             #grid.col = col,
             transparency = 0,
             link.lwd = 1.8,
             link.lty = 1,
             link.border = "black",
             grid.border = 'black',
             big.gap = 2,
             annotationTrack = "grid",
             preAllocateTracks = list(track.height = max(strwidth(unlist(dimnames(data_set))))))

circos.track(track.index = 1, panel.fun = function(x, y) {
              circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index,
              facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
            }, bg.border = NA) #这个不能缺

circos.clear()

}
