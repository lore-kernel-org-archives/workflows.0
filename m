Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4CFC76196
	for <workflows@archiver.kernel.org>; Mon,  3 Apr 2023 21:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbjDCVqH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Apr 2023 17:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbjDCVqF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Apr 2023 17:46:05 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5213A4C19
        for <workflows@vger.kernel.org>; Mon,  3 Apr 2023 14:45:40 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id k12so3367260qvo.13
        for <workflows@vger.kernel.org>; Mon, 03 Apr 2023 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680558333;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCsAikI9LZN3foJtntGxnCVRz6J2brUlKcWcL1/aA0E=;
        b=U3OwkOish1dUXz1/0nN/pqNe9IvbewleTdajk5gdO7W8up/hDRnO26L0vo2Drat+lk
         YjYX4aBHnUxfkYJEDwLBjD+++krqp50RTekLabUq98RLx9Tj0giOLkpUhBItz0rOtHHI
         KIWde7oPfYnsNITIYtKQKkL3IYaVXWEn2py9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558333;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCsAikI9LZN3foJtntGxnCVRz6J2brUlKcWcL1/aA0E=;
        b=P+CrBu8CkJzbmckb+TPaak9FR9CvXK9YxBztZsG1v2AvhZhr3aXwWuMxtmwR4ZVz1N
         3ztjsUG3Xj7ezmZQeNVgl5FmVb7H53SoaojSEYfaqW1yejkBYetCz+Qgx5QMoh8DSr8w
         UJTLaWSgc4yeUARcYvcBlIHCzqKgoMcf0jT3qorPx+rlSZQCOzjzv8r1CUIDzwN8Fvxm
         4Nk9pHabp5JdzHQQhG84xCbO5mHvG3MnIZe/jj+yQG2IOfsoy/RiDQxcfCESQRfKY4TB
         0yz3KP/oH1F8CWbv6ASbCD0BYcBHFhvZ702Jof6tKGp/TBZk1SJDFi4FwJEKfsiKnknZ
         rUvg==
X-Gm-Message-State: AAQBX9ck5MLCgb6Sa3g1u4Q1v5ZyitP5wtgJ2ymtLAkRAnC4PBj5Rix1
        A+De5BL4EsoXa4WvoTBv7WyEDVBBmAu/J48kHcE=
X-Google-Smtp-Source: AKy350anj74Enc0tWAmqbwHuJkd52fXhUQjpL4tXb8nmKbp6BcEjWTstJUD2sqT8bWDg5Lnalet8tQ==
X-Received: by 2002:a05:6214:2a88:b0:5d9:a36d:3ed2 with SMTP id jr8-20020a0562142a8800b005d9a36d3ed2mr254132qvb.45.1680558333093;
        Mon, 03 Apr 2023 14:45:33 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id 73-20020a37074c000000b0074672975d5csm3109229qkh.91.2023.04.03.14.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:45:32 -0700 (PDT)
Date:   Mon, 3 Apr 2023 17:45:31 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org, aros@gmx.com,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        tools@linux.kernel.org, linux@leemhuis.info
Subject: Introducing bugbot
Message-ID: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

Per our discussion last fall, I've been working on a bridge between bugzilla
and public-inbox, which went live in the past few days. It's still a very
early release, but it can do the following:

1. Create bugs from mailing list discussions, with full history. For example,
   it is sufficient for someone [1] to say "bugbot on" in a mailing list
   discussion to request bugbot to convert that thread into a new bug. It will
   then continue checking that thread for new messages, creating new comments
   for any added communication. This works both ways -- any comments added on
   bugzilla will be sent as follow-up messages to the original recipients.

   New bugs will be created in the Linux/Kernel component of Bugzilla, but
   they can then be reassigned to any other component. As long as they remain
   open, bugbot will continue tracking threads for new messages until either
   the bug is closed, or it has been over 30 days since any activity on the
   bug.

   [1] At this time, the From address of the person saying "bugbot on" has to
   have an account on bugzilla and be part of the "editbugs" group.

   Here's me using it to turn a thread into a bug:
   https://lore.kernel.org/lkml/CAJfuBxwomDagbdNP-Q6WvzcWsNY0Z2Lu2Yy5aZQ1d9W7Ka1_NQ@mail.gmail.com/

2. Start mailing list threads from pre-triaged bugzilla bugs. This works the
   opposite way and creates mailing list threads based on bug reports filed in
   bugzilla. The useful things here are:

   - bugbot only gets triggered on open bugs in Linux/Kernel that have the
     "bugbot" flag set to "+", which allows pre-triaging a bug before bugbot
     sends it to the mailing list
   - there is a special "cf_subsystem" field added to that component; bugbot
     will match it verbatim to the MAINTAINERS file components and will send
     mail to the M: and L: addresses for that subsystem
   - bugbot will then monitor for any updates to that thread, so any mailing
     list replies will be added as comments to the bug (thus sending a
     bugzilla mail notification to the initial author)
   - if the cf_subsystem is incorrect, it can be changed to a different
     subsystem at any time, triggering a different set of recipients on the
     next update
   - any files added in bugzilla will trigger notification sent to the list
     (but won't attach the actual files, so they don't clog everyone's mailbox
     or list archives)

   Artem, I'm not sure if you're still active with bugzilla.kernel.org, but I
   believe the cf_subsystem functionality is pretty much what you wanted so it
   was possible to bring bugs to the attention of actual subsystem
   maintainers.

   Here is a bug that was turned into a mailing list thread via cf_subsystem:
   https://bugzilla.kernel.org/show_bug.cgi?id=217293

Like I said, bugbot is very young and probably full of bugs, so it will still
see a lot of change and will likely explode a couple of times. The code behind
it is here, woefully lacking any documentation as yet:
https://git.kernel.org/pub/scm/utils/peebz/peebz.git/

At this time, I invite anyone with an account on bugzilla and "editbugs" group
membership can start using bugbot in either direction and to report any bugs
you find to the tools list.

Next features on my todo list are:

- documentation
- tracking repositories and recording when bugs are mentioned in commits
- whatever other feedback I receive

Best regards,
Konstantin
