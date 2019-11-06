Return-Path: <SRS0=q5JR=Y6=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8129AC5DF63
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 19:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43D56217D7
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 19:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="emFAagys"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfKFTyr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 6 Nov 2019 14:54:47 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:36273 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfKFTyr (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 6 Nov 2019 14:54:47 -0500
Received: by mail-vk1-f182.google.com with SMTP id d10so1320824vke.3
        for <workflows@vger.kernel.org>; Wed, 06 Nov 2019 11:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CGlJ80p/JADLLHurmRtqIR7SVER5m+mAVd3eyQM642k=;
        b=emFAagys5IvNt/y6c01E8O6WcLVAnkYw+GbuluFZlbkTbqt6uSetpPKAtv9Ureepe/
         UTB0W+OHmcLabl8jmHoIydON31DYSLMCXjBUyeFDysZ/7EiB6kbK5CQkW7VHgUKI0v7e
         72kwGKSFJMJcGezpC2njcAG4gLURKaGnYqe5whsfE68WShlRyGVSJq6xDhUFSKAcwq13
         MF6yOYMcOIy+bJ5zYmWSmKBgh7Cj/gCwNPA5GlTUmkxUOXnOWAYZneV0cy7/n8LW+C2C
         nqLeCkqCcwU6bLWNMAMPoOflDrgjdHo40bNr3nmdx1wo9lEEqpXWI/35npD6Wbqo8yfh
         ojTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CGlJ80p/JADLLHurmRtqIR7SVER5m+mAVd3eyQM642k=;
        b=amLPQGsk+Ml8aErme1u43vtLHD12sModGv/UapOTyoAiFyu392bln9wxlSn6Kfn+Ia
         j+Kj2Iuix0mIJBNMPADSxOZr9mSE81/L5H2xRJHst7olUOoVrKAlcFEx1dnaldq0ojpS
         3StP9bHK+lYsc45l45bzDqmnEM+tEYYgkFrWUY/MMUYFVddl4QJuAUYNijvwSaIvgUbi
         VTwM3qPIQVZmpNpdMl7IIXaB7ayuGtWniEHl3Tar/W1l91G+p7S8wt2eqV0tFDdTIgYg
         bv+BsVRPgGDBlmqzKk0P/x8uPIVc1DrwYJzpOxkj8qRU0euL5OkZ8T0dSbiO9xPsUkLD
         TQMQ==
X-Gm-Message-State: APjAAAU3SkyT34oLKUhAJ5Iogenbygmvn5ENL2QcSszpTBZ/9G5g1Ot6
        bbItes5tA3QzP9x4qITyI36pcpjXtKpt7A1gquITTsDtcbk=
X-Google-Smtp-Source: APXvYqwu0fj9l1Orj3+bjFgbiyibW4d9QT/2cV6MTsVX8e9AaD7tk6+h/z7nSgVCigv+fl8XmG4QfvYa9VQWO1eO3l8=
X-Received: by 2002:a1f:f24b:: with SMTP id q72mr2455572vkh.94.1573070085552;
 Wed, 06 Nov 2019 11:54:45 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
In-Reply-To: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Wed, 6 Nov 2019 20:54:32 +0100
Message-ID: <CAFQ2z_O+_T8QZOHfr4YjpSJ7Qo=GvHq0RE1Hvq8LiL7dimNWkA@mail.gmail.com>
Subject: Re: Structured feeds
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 5, 2019 at 11:02 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Eventually git-lfs (https://git-lfs.github.com) may be used to embed
>
> blob's right into feeds. This would allow users to fetch only the
> blobs they are interested in. But this does not need to happen from
> day one.

I would avoid building something around git-lfs. The git upstream
project is actively working on providing something that is less hacky
and more reproducible.

Also, if we're using Git to represent the feed and are thinking about
embedding blobs, it would be much more practical to just add a copy of
the linux kernel to the Lore repository, and introduce a commit for
each patch. The linux kernel is about 1.5G, which is much smaller than
the Lore archive, isn't it? You could store each patch under any of
these branch names :

  refs/patches/MESSAGE-ID
  refs/patches/URL-ESCAPE(MESSAGE-ID)
  refs/patches/SHA1(MESSAGE-ID)
  refs/patches/AUTHOR/MESSAGE-ID

this will lead to a large number of branches, but this is actually
something that is being addressed in Git with reftable.

> No work has been done on the actual form/schema of the structured
> feeds. That's something we need to figure out working on a prototype.
> However, good references would be git-appraise schema:
> https://github.com/google/git-appraise/tree/master/schema
> and gerrit schema (not sure what's a good link).


The gerrit schema for reviews is unfortunately not documented, but it
should be. I'll try to write down something next week, but here is the
gist of it:

Each review ("change") in Gerrit is numbered. The different revisions
("patchsets") of a change 12345 are stored under

  refs/changes/45/12345/${PATCHSET_NUMBER}

they are stored as commits to the main project, ie. if you fetch this
ref, you can check out the proposed change.

A change 12345 has its review metadata under

  refs/changes/45/12345/meta

The metadata is a notes branch. The commit messages on the branch hold
global data on the change (votes, global comments). The per file
comments are in a notemap, where the key is the SHA1 of the patchset
the comment refers to, and the value is JSON data. The format of the
JSON is here:

 https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47e=
322afa8/java/com/google/gerrit/server/notedb/RevisionNoteData.java#25

with the meat in Comment class

  https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47=
e322afa8/java/com/google/gerrit/entities/Comment.java#33

an example

   {
      "key": {
        "uuid": "c7be1334_47885e36",
        "filename":
"java/com/google/gerrit/server/restapi/project/CommitsCollection.java",
        "patchSetId": 7
      },
      "lineNbr": 158,
      "author": {
        "id": 1026112
      },
      "writtenOn": "2019-11-06T09:00:50Z",
      "side": 1,
      "message": "nit: factor this out in a variable, use
toImmutableList as collector",
      "range": {
        "startLine": 156,
        "startChar": 32,
        "endLine": 158,
        "endChar": 66
      },
      "revId": "071c601d6ee1a2a9f520415fd9efef8e00f9cf60",
      "serverId": "173816e5-2b9a-37c3-8a2e-48639d4f1153",
      "unresolved": true
    },

for CI type comments, we have "checks" data and robot comments (an
extension of the previous comment), defined here:

https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47e3=
22afa8/java/com/google/gerrit/entities/RobotComment.java#22

here is an example of CI data that we keep:

 "checks": {
    "fmt:commitmsg-462a7efcf7234c5824393847968ddd28853aef6e": {
      "state": "FAILED",
      "message": "/COMMIT_MSG: subject must not end in \u0027.\u0027",
      "started": "2019-09-13T17:12:46Z",
      "created": "2019-09-11T17:42:40Z",
      "updated": "2019-09-13T17:12:47Z"
    }

JSON definition:
https://gerrit.googlesource.com/plugins/checks/+/0e609a4599d17308664e1d41c0=
f91447640ee9fe/java/com/google/gerrit/plugins/checks/db/NoteDbCheck.java#16


--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich

Registergericht und -nummer: Hamburg, HRB 86891

Sitz der Gesellschaft: Hamburg

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
