// To parse this JSON data, do
//
//     final song = songFromJson(jsonString);

import 'dart:convert';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());


class Song {
    Song({
        this.data,
        this.checksum,
        this.total,
        this.next,
    });

    List<Datum>? data;
    String? checksum;
    int? total;
    String? next;

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        checksum: json["checksum"],
        total: json["total"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "checksum": checksum,
        "total": total,
        "next": next,
    };
}

class Datum {
    Datum({
        this.id,
        this.readable,
        this.title,
        this.titleShort,
        this.titleVersion,
        this.link,
        this.duration,
        this.rank,
        this.explicitLyrics,
        this.explicitContentLyrics,
        this.explicitContentCover,
        this.preview,
        this.md5Image,
        this.timeAdd,
        this.artist,
        this.album,
        this.type,
    });

    int? id;
    bool? readable;
    String? title;
    String? titleShort;
    String? titleVersion;
    String? link;
    int? duration;
    int? rank;
    bool? explicitLyrics;
    int? explicitContentLyrics;
    int? explicitContentCover;
    String? preview;
    String? md5Image;
    int? timeAdd;
    Artist? artist;
    Album? album;
    String? type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        timeAdd: json["time_add"],
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "time_add": timeAdd,
        "artist": artist!.toJson(),
        "album": album!.toJson(),
        "type": type,
    };
}

class Album {
    Album({
        this.id,
        this.title,
        this.cover,
        this.coverSmall,
        this.coverMedium,
        this.coverBig,
        this.coverXl,
        this.md5Image,
        this.tracklist,
        this.type,
    });

    int? id;
    String? title;
    String? cover;
    String? coverSmall;
    String? coverMedium;
    String? coverBig;
    String? coverXl;
    String? md5Image;
    String? tracklist;
    String? type;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: json["md5_image"],
        tracklist: json["tracklist"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5Image,
        "tracklist": tracklist,
        "type": type,
    };
}

class Artist {
    Artist({
        this.id,
        this.name,
        this.link,
        this.picture,
        this.pictureSmall,
        this.pictureMedium,
        this.pictureBig,
        this.pictureXl,
        this.tracklist,
        this.type,
    });

    int? id;
    String? name;
    String? link;
    String? picture;
    String? pictureSmall;
    String? pictureMedium;
    String? pictureBig;
    String? pictureXl;
    String? tracklist;
    String? type;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "type": type,
    };
}
