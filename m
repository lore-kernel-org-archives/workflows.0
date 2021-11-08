Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E14C433F5
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 19:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59B19610A6
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 19:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237868AbhKHTwF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 14:52:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237645AbhKHTwF (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 8 Nov 2021 14:52:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62919610A6
        for <workflows@vger.kernel.org>; Mon,  8 Nov 2021 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636400960;
        bh=QDrzu/LQ5HRw4Jj9UrawcT0KDIPk08lFJyWG6sSl3t8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RFrE8JjzCgpSc2Qfxn0w/U+ZCJIFZddpAy5LGvRZ6ycsASvXFm71AJ1pl4W1MlBLN
         lI9jfG1AaMpXyHZvO0yMtcVV0NvOMEDDUB0jUkYsjtKzpTVyg5YqnXK5pFU8FWfQoJ
         /ud6clsrDPh+qJAWgj+8wasDN47MaXTrISPvjFAVkAjKQUwkev9Pc3uiQ99L0ZY+He
         5uO9GdC0S/t4IDmhELWS1cKvc9mqva609MJOZz4zYUaAI/4j1+9tkwHEaGPyW+hgfY
         3t+tFCNcUUa1aCxgmjaIykrUm1VQeBBRO3XIlHaOmURRoTNJgJhiWWbLEBfq3IlcRI
         07FTlZg1e//dA==
Received: by mail-ed1-f50.google.com with SMTP id w1so67539244edd.10
        for <workflows@vger.kernel.org>; Mon, 08 Nov 2021 11:49:20 -0800 (PST)
X-Gm-Message-State: AOAM533gJt+GNAT35nfR+9zTzo1dXUtbxN3QnDnJY5l2m0SYOeduKWxP
        lQOTmsP4swBUXyNSsaHzHnGqQ8fOLbxtUBJVhw==
X-Google-Smtp-Source: ABdhPJwt4J4quib4dfzFpbRTA1e0xLi6FAsFzntMefUERcRzgTZaaT7toZoJaO2Rvozp9z+E1q9Go0lEQPyK0G+rVvg=
X-Received: by 2002:a50:da06:: with SMTP id z6mr2077046edj.355.1636400958835;
 Mon, 08 Nov 2021 11:49:18 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
In-Reply-To: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 8 Nov 2021 13:49:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
Message-ID: <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
Subject: Re: lore+lei: getting started
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 5, 2021 at 12:07 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello, all:
>
> I am going to post a series of articles about public inbox's new lei tool
> (stands for "local email interface", but is clearly a "lorelei" joke :)). In
> addition to being available here on the workflows list, they will also be
> posted on my people.kernel.org blog.
>
> ## What's the problem?
>
> One of kernel developers' perennial complaints is that they just get Too Much
> Damn Email. Nobody in their right mind subscribes to "the LKML"
> (linux-kernel@vger.kernel.org) because it acts as a dumping ground for all
> email and the resulting firehose of patches and rants is completely impossible
> for a sane human being to follow.
>
> For this reason, actual Linux development tends to happen on separate mailing
> lists dedicated to each particular subsystem. In turn, this has several
> negative side-effects:
>
> 1. Developers working across multiple subsystems end up needing to subscribe
>    to many different mailing lists in order to stay aware of what is happening
>    in each area of the kernel.
>
> 2. Contributors submitting patches find it increasingly difficult to know
>    where to send their work, especially if their patches touch many different
>    subsystems.
>
> The `get_maintainer.pl` script is an attempt to solve the problem #2, and will
> look at the diff contents in order to suggest the list of recipients for each
> submitted patch. However, the submitter needs to be both aware of this script
> and know how to properly configure it in order to correctly use it with
> git-send-email.
>
> Further complicating the matter is the fact that `get_maintainer.pl` relies on
> the entries in the `MAINTAINERS` file. Any edits to that file must go through
> the regular patch submission and review process and it may take days or weeks
> before the updates find their way to individual contributors.
>
> Wouldn't it be nice if contributors could just send their patches to one
> place, and developers could just filter out the stuff that is relevant to
> their subsystem and ignore the rest?
>
> ## lore meets lei
>
> Public-inbox started out as a distributed mailing list archival framework with
> powerful search capabilities. We were happy to adopt it for our needs when we
> needed a proper home for kernel mailing list archives -- thus, lore.kernel.org
> came online.
>
> Even though it started out as merely a list archival service, it quickly
> became obvious that lore could be used for a lot more. Many developers ended
> up using its search features to quickly locate emails of interest, which in
> turn raised a simple question -- what if there was a way to "save a search"
> and have it deliver all new incoming mail matching certain parameters straight
> to the developers' inbox?
>
> You can now do this with lei.
>
> ## lore's search syntax
>
> Public-inbox uses Xapian behind the scenes, which allows to narrowly tailor
> the keyword database to very specific needs.
>
> For example, did you know that you can search lore.kernel.org for patches that
> touch specific files? Here's every patch that touched the MAINTAINERS file:
>
> * https://lore.kernel.org/all/?q=dfn%3AMAINTAINERS
>
> How about every patch that modifies a function that starts with `floppy_`:
>
> * https://lore.kernel.org/all/?q=dfhh%3Afloppy_*
>
> Say you're the floppy driver maintainer and wanted to find all mail that
> touches `drivers/block/floppy.c` and modifies any function that starts with
> `floppy_` or has "floppy" in the subject and maybe any other mail that
> mentions "floppy" and has the words "bug" or "regression"? And maybe limit the
> results to just the past month.
>
> Here's the query:
>
>     (dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy
>      OR ((nq:bug OR nq:regression) AND nq:floppy))
>     AND rt:1.month.ago..
>
> And here are the results:
>
> * https://lore.kernel.org/all/?q=%28dfhh%3Afloppy_*+OR+dfn%3Adrivers%2Fblock%2Ffloppy.c+OR+s%3Afloppy+OR+%28%28nq%3Abug+OR+nq%3Aregression%29+AND+nq%3Afloppy%29%29+AND+rt%3A1.month.ago..
>
> Now, how about getting that straight into your mailbox, so you don't have to
> subscribe to the (very busy) linux-block list, if you are the floppy
> maintainer?
>
> ## Installing lei
>
> Lei is very new and probably isn't yet available as part of your distribution,
> but I hope that it will change quickly once everyone realizes how awesome it
> is.
>
> I'm working on packaging lei for Fedora, so depending on when you're reading
> this, try `dnf install lei` -- maybe it's already there. If it's not in Fedora
> proper yet, you can get it from my copr:
>
>     dnf copr enable icon/b4
>     dnf install lei
>
> If you're not a Fedora user, just consult the INSTALL file:
>
> * https://public-inbox.org/INSTALL.html
>
> ## Maildir or IMAP?
>
> Lei can deliver search results either into a local maildir, or to a remote
> IMAP folder (or both). We'll do local maildir first and look at IMAP in a
> future follow-up, as it requires some preparatory work.
>
> ## Getting going with lei-q
>
> Let's take the exact query we used for the floppy drive above, and get lei to
> deliver entire matching threads into a local maildir folder that we can read
> with mutt:
>
>     lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
>       --threads --dedupe=mid \
>       '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
>       OR ((nq:bug OR nq:regression) AND nq:floppy)) \
>       AND rt:1.month.ago..'

I tried a similar one which I had working as a bookmark:

$ lei q -I https://lore.kernel.org/all/ -o ~/Mail/my-patches
--threads --dedupe=mid '(dfn:drivers OR dfn:arch OR dfn:Documentation
OR dfn:include OR dfn:scripts) AND f:robh@kernel.org'
# /home/rob/.local/share/lei/store 0/0
# /usr/bin/curl -Sf -s -d ''
https://lore.kernel.org/all/?x=m&t=1&q=(dfn%3A%22drivers+OR+dfn%3Aarch+OR+dfn%3ADocumentation+OR+dfn%3Ainclude+OR+dfn%3Ascripts)+AND+f%3Arobh%40kernel.org%22
# 0 written to /home/rob/Mail/my-patches/ (0 matches)

It seems there is some problem in quoting. Notice the '%22' that's
inserted in the url.

Also, the above query is a bit of a work-around as what I really want
is just all patches from me. I haven't been able to get something to
work. I've tried things like 'dfn:*' or 'dfn:/' or 'dfn:b/'.

Rob
