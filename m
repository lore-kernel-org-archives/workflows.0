Return-Path: <SRS0=7bkH=5P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0855EC2D0EB
	for <workflows@archiver.kernel.org>; Mon, 30 Mar 2020 08:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2AA020732
	for <workflows@archiver.kernel.org>; Mon, 30 Mar 2020 08:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NIorDYb7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgC3ItT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Mar 2020 04:49:19 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38716 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgC3ItQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Mar 2020 04:49:16 -0400
Received: by mail-qk1-f194.google.com with SMTP id h14so18113850qke.5
        for <workflows@vger.kernel.org>; Mon, 30 Mar 2020 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1MvP6jjTClxZjomf4y/1rTjGh6SHCpZ+cZ78lowmGv8=;
        b=NIorDYb71y+7N2hKRlp459wSMGgmYVKq560Mqrp50kXGZ5X1N4RQG8zmyAGaMTgmdu
         /lte169yYFNWz9xu2FXn9x/5/AnDgx+Js5Yp9fQNJ2zqN/EJJgSpoThMp2ASaRu74cII
         eQFMD6a4VIYD+2/ukQ1lePK7USRLwTht8TGVzxkVxbPRRuL49hEIQ8Fh02CVS8MjBp6w
         /4UUUC0BpnyaE3siOwbjfcDRllJsn9kr+crGB4Zyzwa0taRL20wNBzaGS/r1OyFb1QP+
         dljUWmj7XoazBtedDLO+hMrvobuLwhnbE2lJTEzfZQXjFxixzUn5fIueto0FhUBK5ANC
         7SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1MvP6jjTClxZjomf4y/1rTjGh6SHCpZ+cZ78lowmGv8=;
        b=KQchHDIPRvtXRqerG95F3590EtdrLFR7PmW5I2/bnpiIQolMlu5SLvEb03yZGAW76B
         pyKIWCPbzEvA6V18+H13oud+qf93c5EPSfVhQvjUCi0OuH+7wJQktkWYsXo5FaeRdIta
         DMBwYBfrdOE7TmoPVUuCZE0R+bOYu3SsJmxcJpzfx0JtCadQ0slcN/UdVWHzgWJZhjkK
         ccm2DXT2qd24HmIxGYwXiZKC26X+IkFBoeG1TWCaS86Ta/wigbOWSz1N9qsqH1iFz9yo
         5bUezVxm4+sKBfJV8V/UQhpX+Eg/pPwpzIkn+87Gru51ukvPCPHUJcPkSjjmaUmghsHD
         Yv9w==
X-Gm-Message-State: ANhLgQ2DfagHVBDdKxEqpB7xCis7qwsJlrcEx/yqWG2577FDTTfOVYKl
        5x8+ke0eMhVcuzjFfJgGLlHiw3/WnzJ2cminrheOl7bIxc7tmA==
X-Google-Smtp-Source: ADFU+vvlvHS5oQnOdCxt81qF7x6wm/zJf8J4tpcLPxVGfcXFv9+a0L5awM5x4RTeoTRt8rXpmBKr+hKoCBFa0/LAA9E=
X-Received: by 2002:a05:620a:348:: with SMTP id t8mr9415600qkm.407.1585558154683;
 Mon, 30 Mar 2020 01:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200327223646.20779-1-gpiccoli@canonical.com>
 <7fe65aef-94e1-b51a-0434-b1fe9d402d7b@i-love.sakura.ne.jp> <CAHD1Q_zx29ZP37WcUr34ZEyqWkA9J23RmLa8jFyuLDrS_yC50A@mail.gmail.com>
In-Reply-To: <CAHD1Q_zx29ZP37WcUr34ZEyqWkA9J23RmLa8jFyuLDrS_yC50A@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 30 Mar 2020 10:49:03 +0200
Message-ID: <CACT4Y+bjsEFsP1ELGuTXbZV5m3gWys444p5cq=375KPkpFk0Gg@mail.gmail.com>
Subject: Re: [PATCH V3] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
To:     Guilherme Piccoli <gpiccoli@canonical.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>, kernelci@groups.io,
        CKI Project <cki-project@redhat.com>,
        kbuild test robot <lkp@intel.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Mar 30, 2020 at 2:43 AM Guilherme Piccoli
<gpiccoli@canonical.com> wrote:
>
> Hi Tetsuo and Dmitry, thanks for noticing this Tetsuo. And sorry for
> not looping you in the patch Dmitry, I wasn't aware that you were
> working with testing. By the way, I suggest people interested in linux
> testing to create a ML; I'd be glad to have looped such list, but I
> couldn't find information about a group dealing with testing.
>
> So Tetsuo, you got it right: just change it to
> "sysctl.kernel.hung_task_all_cpu_backtrace=1" and that should work
> fine, once Vlastimil's patch gets merged (and I hope it happens soon).
> Cheers,
>
>
> Guilherme

+LKML, workflows, syzkaller, kernelci, cki, kbuild

Tetsuo, thanks for notifying again.

Yes, kernel devs breaking all testing happens from time to time and
currently there is no good way to address this.
Other things I remember is the introduction of CONFIG_DEBUG_MEMORY,
which defaults to =n and disables KASAN, which in turn produced an
explosion of assorted crashes caused by memory corruptions; also
periodic changes in kernel crash messages which I assume all testing
systems parse and need to understand.

Is there already a mailing list for this? Or should we create one?
I.e. announce and changes that may need actions from all testing
systems.
Another thing that may benefit from announcements is addition of new
useful debugging configs. Currently they are introduced silently and
don't reach the target audience.
