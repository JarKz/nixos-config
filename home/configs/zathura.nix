{ ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      # Шрифты (подставьте свой системный, например, Roboto или Inter)
      font = "JetBrainsMono NFM";

      # Цветовая схема под Materia Dark
      default-bg = "#212121"; # Основной фон (Materia dark gray)
      default-fg = "#ECEFF1"; # Основной текст

      statusbar-bg = "#263238";
      statusbar-fg = "#ECEFF1";

      inputbar-bg = "#212121";
      inputbar-fg = "#80CBC4"; # Акцентный цвет (Teal)

      notification-error-bg = "#E53935";
      notification-error-fg = "#FFFFFF";

      notification-warning-bg = "#FFB300";
      notification-warning-fg = "#212121";

      highlight-color = "#80CBC4";
      highlight-active-color = "#00897B";

      # Цвета режима рекосметика (Recolor) — включается по 'Ctrl+R'
      # Это сделает PDF темным, даже если он изначально белый
      recolor = "false"; # Включить по умолчанию
      recolor-lightcolor = "#212121"; # Цвет бумаги
      recolor-darkcolor = "#ECEFF1"; # Цвет шрифта

      # Плавность и поведение
      scroll-step = "50";
      selclipboard = "clipboard"; # Копировать в системный буфер обмена
      render-loading = "false"; # Чтобы не мигало при обновлении
    };
  };
}
