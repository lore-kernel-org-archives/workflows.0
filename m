Return-Path: <SRS0=Mr7I=Y5=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765F8CA9ECF
	for <workflows@archiver.kernel.org>; Tue,  5 Nov 2019 10:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34C922190F
	for <workflows@archiver.kernel.org>; Tue,  5 Nov 2019 10:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbYDiFeN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387702AbfKEKCf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 5 Nov 2019 05:02:35 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42264 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbfKEKCf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 5 Nov 2019 05:02:35 -0500
Received: by mail-qk1-f196.google.com with SMTP id m4so20546135qke.9
        for <workflows@vger.kernel.org>; Tue, 05 Nov 2019 02:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nhQb/F2pkvbhyhC8tzL1BGfO/p8rDE7yYvkaHyy1qyA=;
        b=rbYDiFeNwiFm+ReN1lDSg+lPIIyGhAPuMPeCrSnE3CNGNyUZ8s1sqICZXfs8+c/u+R
         abmuPUwfr4QEwBMujk39ZsackZN66DoNk5fwaQecWMVjFl2jSkH7FunQNisVoCPAhmpt
         apk3z0aQ1D7Fpo4CzSwuaHoLZrItSEdLadjcNjAXpm/kqs8I1bV8wabG6kqzKhIEOgrW
         wdlzDD44oKUdq3bY515D7cDTxl25V6JkHIKQF4Mo6T96/Tcs330FrqicJTtxJYzar9CD
         ViAGU/HATLKHiguEu0SCR0EZIRVNx2PcRy2gZVfSagKg1QfPzFtrEtUGFVh5MPTx6dgW
         X4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nhQb/F2pkvbhyhC8tzL1BGfO/p8rDE7yYvkaHyy1qyA=;
        b=EqiV87Q728vwwPsq8JXoBcfPqw7XRgcNTRSHSpyKYYihuW1UQUeyLy7lb5nG+Y7WqJ
         hjdH5+2ftkVvp1yT8HyQws/7gvva8bPqKTDzjBB+nB1++TMKOGELBMgldmgTd9vI2D0Z
         7puiDTvmxNMZ5thljNj/AP4zW8urT4aihNN1MdlK+YM7Np8CBODOB5+0F09SDjo9ytqD
         diL4SK7u4vaTurTNQ3fe5idTcFcSDzEINKYiV2HFw1PWGXsA4NCbfu2A+RyU8Y5XcmXQ
         FdQvsOEG3V0qbysQwX5SR5SYNpGDb7hOhxnj+wdq6sgjbEcGG39y14kaB4ZLwd+T5Ppo
         WfNQ==
X-Gm-Message-State: APjAAAWbQBIZyZ6EMivM1q5iJs8FTls8rg37s9EAByDiq+22bXtA/qcC
        ++mT5ludSyEaDD4XLYk2nKy0dWBC8AwKebQmqdgDdBXihvQ=
X-Google-Smtp-Source: APXvYqwKqGdDnuroGOxnCaihxe8shRFEq0n9d0rKaWEY8zv0AQq2YjE0ULA/LI2WaWb0Ocr/t/e0rYPKPHjIitgiC8o=
X-Received: by 2002:a37:6156:: with SMTP id v83mr20195667qkb.43.1572948152615;
 Tue, 05 Nov 2019 02:02:32 -0800 (PST)
MIME-Version: 1.0
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 5 Nov 2019 11:02:21 +0100
Message-ID: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
Subject: Structured feeds
To:     workflows@vger.kernel.org, automated-testing@yoctoproject.org
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi,

This is another follow up after Lyon meetings. The main discussion was
mainly around email process (attestation, archival, etc):
https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t

I think providing info in a structured form is the key for allowing
building more tooling and automation at a reasonable price. So I
discussed with CI/Gerrit people and Konstantin how the structured
information can fit into the current "feeds model" and what would be
the next steps for bringing it to life.

Here is the outline of the idea.
The current public inbox format is a git repo with refs/heads/master
that contains a single file "m" in RFC822 format. We add
refs/heads/json with a single file "j" that contains structured data
in JSON format. 2 separate branches b/c some clients may want to fetch
just one of them.

Current clients will only create plain text "m" entry. However, newer
clients can also create a parallel "j" entry with the same info in
structured form. "m" and "j" are cross-referenced using the
Message-ID. It's OK to have only "m", or both, but not only "j" (any
client needs to generate at least some text representation for every
message).

Currently we have public inbox feeds only for mailing lists. The idea
is that more entities will have own "private" feeds. For example, each
CI system, static analysis system, or third-party code review system
has its own feed. Eventually people have own feeds too. The feeds can
be relatively easily converted to local inbox, important into GMail,
etc (potentially with some filtering).

Besides private feeds there are also aggregated feeds to not require
everybody to fetch thousands of repositories. kernel.org will provide
one, but it can be mirrored (or build independently) anywhere else. If
I create https://github.com/dvyukov/kfeed.git for my feed and Linus
creates git://git.kernel.org/pub/scm/linux/kernel/git/dvyukov/kfeed.git,
then the aggregated feed will map these to the following branches:
refs/heads/github.com/dvyukov/kfeed/master
refs/heads/github.com/dvyukov/kfeed/json
refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/master
refs/heads/git.kernel.org/pub/scm/linux/kernel/git/torvalds/kfeed/json
Standardized naming of sub-feeds allows a single repo to host multiple
feeds. For example, github/gitlab/gerrit bridge could host multiple
individual feeds for their users.
So far there is no proposal for feed auto-discovery. One needs to
notify kernel.org for inclusion of their feed into the main aggregated
feed.

Konstantin offered that kernel.org can send emails for some feeds.
That is, normally one sends out an email and then commits it to the
feed. Instead some systems can just commit the message to feed and
then kernel.org will pull the feed and send emails on user's behalf.
This allows clients to not deal with email at all (including mail
client setup). Which is nice.

Eventually git-lfs (https://git-lfs.github.com) may be used to embed
blob's right into feeds. This would allow users to fetch only the
blobs they are interested in. But this does not need to happen from
day one.

As soon as we have a bridge from plain-text emails into the structured
form, we can start building everything else in the structured world.
Such bridge needs to parse new incoming emails, try to make sense out
of them (new patch, new patch version, comment, etc) and then push the
information in structured form. Then e.g. CIs can fetch info about
patches under review, test and post strctured results. Bridging in the
opposite direction happens semi-automatically as CI also pushes text
representation of results and that just needs to be sent as email.
Alternatively, we could have a separate explicit converted of
structured message into plain text, which would allow to remove some
duplication and present results in more consistent form.

Similarly, it should be much simpler for Patchwork/Gerrit to present
current patches under review. Local mode should work almost seamlessly
-- you fetch the aggregated feed and then run local instance on top of
it.

No work has been done on the actual form/schema of the structured
feeds. That's something we need to figure out working on a prototype.
However, good references would be git-appraise schema:
https://github.com/google/git-appraise/tree/master/schema
and gerrit schema (not sure what's a good link). Does anybody know
where the gitlab schema is? Or other similar schemes?

Thoughts and comments are welcome.
Thanks
