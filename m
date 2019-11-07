Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D698DC5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90E0E2187F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p76b62Tx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733139AbfKGJE4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 04:04:56 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41396 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfKGJEz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 04:04:55 -0500
Received: by mail-qt1-f196.google.com with SMTP id o3so1604018qtj.8
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 01:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1tAcYzp0i1AINqMLWqqNqbd3uyNX4xHUf5E+Rx2D0Ak=;
        b=p76b62TxcspT8feefC+0l+FfmAoaq+4gwjdLMPwhkP7smZ13zZR2AkShrqVItnBrfi
         87hKca6nAWOCG1euvDd+vhcLORT1RE68D4nOtI7WKs9L12ZhSF5Jw0sbo5kBruNnN3Yw
         gmVV1hPlV8u/O/HRrX4Q6SW6ZOITjagRsC+oCecTCcORLIkie4sUEr8b62Lxet5kVUWT
         5dxQgDsPHaHxTx4/s2Wm3KczkwHW6lf1vnxE/h8YUDXADT4lqnXitJ2ADTL7z3y2Ytc1
         ydZraQ0jJdRcwD9F37vLlMR/B9/azLQp18K52d5nTpRaW0e/bIeFdZtOh+1QOogOjEGi
         7ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tAcYzp0i1AINqMLWqqNqbd3uyNX4xHUf5E+Rx2D0Ak=;
        b=lNg6YA1UuEz9aufFjAuOr7zSChCrYJ5fXl0I4+UpFjIZhCVRiA2WWb7dqCcdbkLDGi
         FmVGGhut3S4i/OrinyFpLvDqxppzengdzwZGLNL91bHCRlTmbroBNSw7OgizxI4CF4TZ
         BnilyMDVSwoexoklrWecHxjBX9Kyqbp1ZNXKwL6ku9lqJz8LSqwiD7ueTkNQ8wmjc+Fq
         Tg/tWKEihyDc1ngSbWwc/c+6bPSznPVNDoWFA3WDhTqYuSr87o/i5nE5bz1nHW5rCNH5
         VdJfPBkohWownR38RTnJxVhh+DUJDYmsa0rFbbkssum5LCByX8nHuw8jPeyIhCvYTVtc
         22Dg==
X-Gm-Message-State: APjAAAXvmI+8zwT30JYS1Gt+RkZhnISteHJmTEf10fG8fpBcdqJUsRRF
        0zlWQfM/lzdCTvPyzjsqdaSKt6/9r1hGjpVjxeDAlLGKSSM=
X-Google-Smtp-Source: APXvYqwdxTAxk6KOdflsKBZ5rAh2zZHTbpk1w0yxrZDJBRiZZXbnL5Xt5stMnrhsbZD9a1lZ4F/Hm5/QPSiKehoWlL8=
X-Received: by 2002:ac8:ccf:: with SMTP id o15mr2691910qti.380.1573117493849;
 Thu, 07 Nov 2019 01:04:53 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <CAFQ2z_O+_T8QZOHfr4YjpSJ7Qo=GvHq0RE1Hvq8LiL7dimNWkA@mail.gmail.com>
In-Reply-To: <CAFQ2z_O+_T8QZOHfr4YjpSJ7Qo=GvHq0RE1Hvq8LiL7dimNWkA@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 Nov 2019 10:04:42 +0100
Message-ID: <CACT4Y+Ypsj1f4Qw-Ab5jP3AGwof1udCTcUm0FiAzSMXkp7MZEA@mail.gmail.com>
Subject: Re: Structured feeds
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 6, 2019 at 8:54 PM Han-Wen Nienhuys <hanwen@google.com> wrote:
>
> On Tue, Nov 5, 2019 at 11:02 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Eventually git-lfs (https://git-lfs.github.com) may be used to embed
> >
> > blob's right into feeds. This would allow users to fetch only the
> > blobs they are interested in. But this does not need to happen from
> > day one.
>
> I would avoid building something around git-lfs. The git upstream
> project is actively working on providing something that is less hacky
> and more reproducible.

Noted.
I mostly just captured what Konstantin pointed to. I think (1) blob
embedding is not version 1, (2) whatever we do, somebody needs to
prototype and try first.

> Also, if we're using Git to represent the feed and are thinking about
> embedding blobs,

Blobs are not about patches. Patches are small and not binary.
Blobs would be kernel binaries, test binaries, images, code dumps, etc.

> it would be much more practical to just add a copy of
> the linux kernel to the Lore repository, and introduce a commit for
> each patch. The linux kernel is about 1.5G, which is much smaller than
> the Lore archive, isn't it? You could store each patch under any of
> these branch names :
>
>   refs/patches/MESSAGE-ID
>   refs/patches/URL-ESCAPE(MESSAGE-ID)
>   refs/patches/SHA1(MESSAGE-ID)
>   refs/patches/AUTHOR/MESSAGE-ID
>
> this will lead to a large number of branches, but this is actually
> something that is being addressed in Git with reftable.

Interesting. I need to think how exactly it can be integrated as
kernel is not a single tree. Though, obviously fetching exact git tree
is very nice. But it's somewhat orthogonal to feeds and may be
provided by another specialized bot feed ("I posted your patch to git
and it's available here"), this way this will work for legacy email
patches too.

> > No work has been done on the actual form/schema of the structured
> > feeds. That's something we need to figure out working on a prototype.
> > However, good references would be git-appraise schema:
> > https://github.com/google/git-appraise/tree/master/schema
> > and gerrit schema (not sure what's a good link).
>
>
> The gerrit schema for reviews is unfortunately not documented, but it
> should be. I'll try to write down something next week, but here is the
> gist of it:
>
> Each review ("change") in Gerrit is numbered. The different revisions
> ("patchsets") of a change 12345 are stored under
>
>   refs/changes/45/12345/${PATCHSET_NUMBER}
>
> they are stored as commits to the main project, ie. if you fetch this
> ref, you can check out the proposed change.
>
> A change 12345 has its review metadata under
>
>   refs/changes/45/12345/meta
>
> The metadata is a notes branch. The commit messages on the branch hold
> global data on the change (votes, global comments). The per file
> comments are in a notemap, where the key is the SHA1 of the patchset
> the comment refers to, and the value is JSON data. The format of the
> JSON is here:
>
>  https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47e322afa8/java/com/google/gerrit/server/notedb/RevisionNoteData.java#25
>
> with the meat in Comment class
>
>   https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47e322afa8/java/com/google/gerrit/entities/Comment.java#33
>
> an example
>
>    {
>       "key": {
>         "uuid": "c7be1334_47885e36",
>         "filename":
> "java/com/google/gerrit/server/restapi/project/CommitsCollection.java",
>         "patchSetId": 7
>       },
>       "lineNbr": 158,
>       "author": {
>         "id": 1026112
>       },
>       "writtenOn": "2019-11-06T09:00:50Z",
>       "side": 1,
>       "message": "nit: factor this out in a variable, use
> toImmutableList as collector",
>       "range": {
>         "startLine": 156,
>         "startChar": 32,
>         "endLine": 158,
>         "endChar": 66
>       },
>       "revId": "071c601d6ee1a2a9f520415fd9efef8e00f9cf60",
>       "serverId": "173816e5-2b9a-37c3-8a2e-48639d4f1153",
>       "unresolved": true
>     },
>
> for CI type comments, we have "checks" data and robot comments (an
> extension of the previous comment), defined here:
>
> https://gerrit.googlesource.com/gerrit/+/9a6b8da5736536405da8bf5956fb3b47e322afa8/java/com/google/gerrit/entities/RobotComment.java#22
>
> here is an example of CI data that we keep:
>
>  "checks": {
>     "fmt:commitmsg-462a7efcf7234c5824393847968ddd28853aef6e": {
>       "state": "FAILED",
>       "message": "/COMMIT_MSG: subject must not end in \u0027.\u0027",
>       "started": "2019-09-13T17:12:46Z",
>       "created": "2019-09-11T17:42:40Z",
>       "updated": "2019-09-13T17:12:47Z"
>     }
>
> JSON definition:
> https://gerrit.googlesource.com/plugins/checks/+/0e609a4599d17308664e1d41c0f91447640ee9fe/java/com/google/gerrit/plugins/checks/db/NoteDbCheck.java#16

I've added a reference to this for future reference here:
https://github.com/dvyukov/kit/blob/master/doc/references.md
Thanks!
