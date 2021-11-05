Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49279C433EF
	for <workflows@archiver.kernel.org>; Fri,  5 Nov 2021 17:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B7961108
	for <workflows@archiver.kernel.org>; Fri,  5 Nov 2021 17:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhKERK0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 5 Nov 2021 13:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhKERKV (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 5 Nov 2021 13:10:21 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540ECC061714
        for <workflows@vger.kernel.org>; Fri,  5 Nov 2021 10:07:41 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id p138so2850501qke.10
        for <workflows@vger.kernel.org>; Fri, 05 Nov 2021 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=1A5H4s038DlSXeqIkAwaE2uudYNq0RcPHnhLcQ6k3qw=;
        b=SUS3goPouGeq/P0WaMsm6xZsFEKl/kHg7/sConM0xhdkVNtMbMPPQ+1A7v0V4/82pg
         YSQlbDMhEhe/xFypyCgrkAxPPmPu5RYBLVhZA7QvcUbxwY2lUeoPifzdUB2RUECzAH8F
         CkGhxO4LjupMsSKg31IgRCXlJRURwS0Yo3fy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=1A5H4s038DlSXeqIkAwaE2uudYNq0RcPHnhLcQ6k3qw=;
        b=Tyrj/6EVnXQTcjbRM3WBB0uG6sbTUD3dzZSo3Xn3UDF9eBLkramYI2asIGkov2Tcpo
         nPU2qvPfGdqnZ1VjzJpZIHpvHJqE5GULaiYkQ0A01N2TaySrKIYmLcCEDQpetYB+9NEk
         7ZsxGYITp65vkKezYNxs1uVG/cpMwURrKHVE+m+h8PkGaO8xOUCs8Og7Zl0w7Jlb+91z
         HbG7G0uTqq7v55gAm5zS49OwfWWYJ8VRS/ELMQTr9jwOX2zDKfsorBAKZSRmALmGt4YD
         g0R2VC4gKsXumo/P+A+BjjRrCDkL7CYJtKpUL5mmqw9LA+nmCep6GeKd9ympQNLuuLTJ
         +rkQ==
X-Gm-Message-State: AOAM5334IQrOtVYt1OsLnkrgqHDc7azbYTeulDprKgQ1bksuAU1yGaHq
        WPuNYy+tDra9gE6K3SnXZj7PnEDROG+Szg==
X-Google-Smtp-Source: ABdhPJwqcUF2csmbCa2a6dB2Om1IR162SPOmlZhnZtOvFaeZBFGf4CJiz1KyZZBDJMuK4v+iGho76Q==
X-Received: by 2002:a05:620a:2887:: with SMTP id j7mr46881880qkp.390.1636132059840;
        Fri, 05 Nov 2021 10:07:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id z12sm503480qta.31.2021.11.05.10.07.39
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 10:07:39 -0700 (PDT)
Date:   Fri, 5 Nov 2021 13:07:38 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: lore+lei: getting started
Message-ID: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello, all:

I am going to post a series of articles about public inbox's new lei tool
(stands for "local email interface", but is clearly a "lorelei" joke :)). In
addition to being available here on the workflows list, they will also be
posted on my people.kernel.org blog.

## What's the problem?

One of kernel developers' perennial complaints is that they just get Too Much
Damn Email. Nobody in their right mind subscribes to "the LKML"
(linux-kernel@vger.kernel.org) because it acts as a dumping ground for all
email and the resulting firehose of patches and rants is completely impossible
for a sane human being to follow.

For this reason, actual Linux development tends to happen on separate mailing
lists dedicated to each particular subsystem. In turn, this has several
negative side-effects:

1. Developers working across multiple subsystems end up needing to subscribe
   to many different mailing lists in order to stay aware of what is happening
   in each area of the kernel.

2. Contributors submitting patches find it increasingly difficult to know
   where to send their work, especially if their patches touch many different
   subsystems.

The `get_maintainer.pl` script is an attempt to solve the problem #2, and will
look at the diff contents in order to suggest the list of recipients for each
submitted patch. However, the submitter needs to be both aware of this script
and know how to properly configure it in order to correctly use it with
git-send-email.

Further complicating the matter is the fact that `get_maintainer.pl` relies on
the entries in the `MAINTAINERS` file. Any edits to that file must go through
the regular patch submission and review process and it may take days or weeks
before the updates find their way to individual contributors.

Wouldn't it be nice if contributors could just send their patches to one
place, and developers could just filter out the stuff that is relevant to
their subsystem and ignore the rest?

## lore meets lei

Public-inbox started out as a distributed mailing list archival framework with
powerful search capabilities. We were happy to adopt it for our needs when we
needed a proper home for kernel mailing list archives -- thus, lore.kernel.org
came online.

Even though it started out as merely a list archival service, it quickly
became obvious that lore could be used for a lot more. Many developers ended
up using its search features to quickly locate emails of interest, which in
turn raised a simple question -- what if there was a way to "save a search"
and have it deliver all new incoming mail matching certain parameters straight
to the developers' inbox?

You can now do this with lei.

## lore's search syntax

Public-inbox uses Xapian behind the scenes, which allows to narrowly tailor
the keyword database to very specific needs.

For example, did you know that you can search lore.kernel.org for patches that
touch specific files? Here's every patch that touched the MAINTAINERS file:

* https://lore.kernel.org/all/?q=dfn%3AMAINTAINERS

How about every patch that modifies a function that starts with `floppy_`:

* https://lore.kernel.org/all/?q=dfhh%3Afloppy_*

Say you're the floppy driver maintainer and wanted to find all mail that
touches `drivers/block/floppy.c` and modifies any function that starts with
`floppy_` or has "floppy" in the subject and maybe any other mail that
mentions "floppy" and has the words "bug" or "regression"? And maybe limit the
results to just the past month.

Here's the query:

    (dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy
     OR ((nq:bug OR nq:regression) AND nq:floppy))
    AND rt:1.month.ago..

And here are the results:

* https://lore.kernel.org/all/?q=%28dfhh%3Afloppy_*+OR+dfn%3Adrivers%2Fblock%2Ffloppy.c+OR+s%3Afloppy+OR+%28%28nq%3Abug+OR+nq%3Aregression%29+AND+nq%3Afloppy%29%29+AND+rt%3A1.month.ago..

Now, how about getting that straight into your mailbox, so you don't have to
subscribe to the (very busy) linux-block list, if you are the floppy
maintainer?

## Installing lei

Lei is very new and probably isn't yet available as part of your distribution,
but I hope that it will change quickly once everyone realizes how awesome it
is.

I'm working on packaging lei for Fedora, so depending on when you're reading
this, try `dnf install lei` -- maybe it's already there. If it's not in Fedora
proper yet, you can get it from my copr:

    dnf copr enable icon/b4
    dnf install lei

If you're not a Fedora user, just consult the INSTALL file:

* https://public-inbox.org/INSTALL.html

## Maildir or IMAP?

Lei can deliver search results either into a local maildir, or to a remote
IMAP folder (or both). We'll do local maildir first and look at IMAP in a
future follow-up, as it requires some preparatory work.

## Getting going with lei-q

Let's take the exact query we used for the floppy drive above, and get lei to
deliver entire matching threads into a local maildir folder that we can read
with mutt:

    lei q -I https://lore.kernel.org/all/ -o ~/Mail/floppy \
      --threads --dedupe=mid \
      '(dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy \
      OR ((nq:bug OR nq:regression) AND nq:floppy)) \
      AND rt:1.month.ago..'

Before you run it, let's understand what it's going to do:

* `-I https://lore.kernel.org/all/` will query the aggregated index that
  contains information about all mailing lists archived on lore.kernel.org. It
  doesn't matter to which list the patch was sent -- if it's on lore, the
  query will find it.

* `-o ~/Mail/floppy` will create a new Maildir folder and put the search
  results there. Make sure that this folder doesn't already exist, or lei will
  clobber anything already present there (unless you use `--augment`, but I
  haven't tested this very extensively yet, so best to start with a clean
  slate).

* `--threads` will deliver entire threads even if the match is somewhere in
  the middle of the discussion. This is handy if, for example, someone
  says "this sounds like a bug in the floppy subsystem" somewhere in the
  middle of a conversation and `--threads` will automatically get you the
  entire conversation context.

* `--dedupe=mid` will deduplicate results based on the message-id header. The
  default behaviour is to dedupe based on the body contents, but with so many
  lists still adding junky "sent to the foo list" footers, this tends to
  result in too many duplicated results. Passing `--dedupe=mid` is less safe
  (someone *could* sneak in a bogus message with an identical message-id and
  have it delivered to you instead), but more convenient. YMMV, BYOB.

* Make sure you don't omit the final ".." in the `rt:` query parameter, or you
  will only get mail that was sent *on* that date, not *since* that date.

As always, backslashes and newlines are there just for readability -- you
don't need to use them.

After the command completes, you should get something similar to what is
below:

    # /usr/bin/curl -Sf -s -d '' https://lore.kernel.org/all/?x=m&t=1&q=(omitted)
    # /home/user/.local/share/lei/store 0/0
    # https://lore.kernel.org/all/ 122/?
    # https://lore.kernel.org/all/ 227/227
    # 150 written to /home/user/Mail/floppy/ (227 matches)

A few things to notice here:

1. The command actually executes a curl call and retrieves the results as an
   mbox file.
2. Lei will automatically convert `1.month.ago` into a precise timestamp
3. The command wrote 150 messages into the maildir we specified

We can now view these results with mutt (or neomutt):

    neomutt -f ~/Mail/floppy

It is safe to delete mail from this folder -- it will not get re-added during
`lei up` runs, as lei keeps track of seen messages on its own.

## Updating with lei-up

By default, `lei -q` will save your search and start keeping track of it. To
see your saved searches, run:

    $ lei ls-search
    /home/user/Mail/floppy

To fetch the newest messages:

    lei up ~/Mail/floppy

You will notice that the first line of output will say that lei automatically
limited the results to only those that arrived since the last time lei was
invoked for this particular saved search, so you will most likely get no new
messages.

As you add more queries in the future, you can update them all at once using:

    lei up --all

## Editing and discarding saved searches

To edit your saved search, just run `lei edit-search`. This will bring up your
$EDITOR with the configuration file lei uses internally:

    ; to refresh with new results, run: lei up /home/user/Mail/floppy
    ; `maxuid' and `lastresult' lines are maintained by "lei up" for optimization
    [lei]
        q = (dfn:drivers/block/floppy.c OR dfhh:floppy_* OR s:floppy OR \
            ((nq:bug OR nq:regression) AND nq:floppy)) AND rt:1.month.ago..
    [lei "q"]
        include = https://lore.kernel.org/all/
        external = 1
        local = 1
        remote = 1
        threads = 1
        dedupe = mid
        output = maildir:/home/user/Mail/floppy
    [external "/home/user/.local/share/lei/store"]
        maxuid = 4821
    [external "https://lore.kernel.org/all/"]
        lastresult = 1636129583

This lets you edit the query parameters if you want to add/remove specific
keywords. I suggest you test them on lore.kernel.org first before putting them
into the configuration file, just to make sure you don't end up retrieving
tens of thousands of messages by mistake.

To delete a saved search, run:

    lei forget-search ~/Mail/floppy

This doesn't delete anything from `~/Mail/floppy`, it just makes it impossible
to run `lei up` to update it.

## Subscribing to entire mailing lists

To subscribe to entire mailing lists, you can query based on the list-id
header. For example, if you wanted to replace your individual subscriptions
to linux-block and linux-scsi with a single lei command, do:

    lei q -I https://lore.kernel.org/all/ -o ~/Mail/lists --dedupe=mid \
      '(l:linux-block.vger.kernel.org OR l:linux-scsi.vger.kernel.org) AND rt:1.week.ago..'

You can always edit this to add more lists at any time.

## Coming next

In the next series installment, I'll talk about how to deliver these results
straight to a remote IMAP folder and how to set up a systemd timer to get
newest mail automatically (if that's your thing -- I prefer to run `lei up`
manually and only when I'm ready for it).

-K
