from __future__ import annotations

import plistlib
from pathlib import Path

SYSTEM_APPS_DIR = Path("/Applications")
LOCAL_APPS_DIR = Path("~/Applications").expanduser()


def list_all_apps() -> list[Path]:
    app_paths = []
    for apps_dir in [SYSTEM_APPS_DIR, LOCAL_APPS_DIR]:
        for path in apps_dir.glob("*"):
            if path.name.endswith(".app"):
                app_paths.append(path)
            elif path.is_dir():
                for child_path in path.glob("*.app"):
                    app_paths.append(child_path)
    return sorted(app_paths)


def get_app_version(app_path: Path) -> str | None:
    info_path = app_path / "Contents/Info.plist"
    if not info_path.exists() or not info_path.is_file():
        return None
    with open(info_path, "rb") as fp:
        plist = plistlib.load(fp)
        return plist.get("CFBundleShortVersionString")


def main():
    for app in list_all_apps():
        version = get_app_version(app)
        if version:
            print(app, version, sep="\t")
        else:
            print(app)


if __name__ == "__main__":
    main()
