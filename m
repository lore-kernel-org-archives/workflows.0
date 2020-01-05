Return-Path: <SRS0=mXxz=22=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625F7C00523
	for <workflows@archiver.kernel.org>; Sun,  5 Jan 2020 03:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B22D21582
	for <workflows@archiver.kernel.org>; Sun,  5 Jan 2020 03:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3qD8gqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAEDto (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 4 Jan 2020 22:49:44 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44401 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgAEDto (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 4 Jan 2020 22:49:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so64121942otj.11
        for <workflows@vger.kernel.org>; Sat, 04 Jan 2020 19:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=GP2GI6NkJEz9jUWcBar1y2VTJy7aIInquYchIZEDQnU=;
        b=Y3qD8gqdWa/NYiFBUp8o0gjGruqQ90oC1CG5au+YAjOXHkTT8G2AXC+IY5WiBg+gTS
         Wn8Q5S37mQ3mDrSL7fsJV1OM5VKn3o4RVLSs5fpppY7Xxj0+kEVYYWAC1oeX28nHVJvF
         O2ZXcoOrlNWwcBwCyy5Milc25bNHCN3tWRAnZE7xYt3iuKzVxFej09GVmlkYUiapycwP
         mS2b+L2xzfFQPj5ZcQnC/Q+L24FGK0hdu5vwH3pLNZKsUwPa55+jYnTfrTa1Z1TlsvmQ
         43LslAYzX0tlM/1JnXWGLCNbhTmRZQCT75f13sFOw8r6ZuE/IHmVdaIn4TmVzTeK40Wp
         LiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=GP2GI6NkJEz9jUWcBar1y2VTJy7aIInquYchIZEDQnU=;
        b=Iri8LYPb0ZyWO3SOA6usTK/pxsoLynZLAPpaBDmqMzgjVMMLfMr+tCB5KynZ3b9FBM
         GHXOPYUshNdgy1faDE8nR8QSTI2f/simGNRg2ajqKJ+RBwUKgP0XU/VZu2M1keoXqbye
         9nSvyn6usHF6+0q5AuOAJMsDnFTqFU/y5SBT3mNybi08IjTSI/z3mTHdLndqxJJPpMp6
         PVzcBa4grPNYJr8O/c+6kVzwINHP32DgYy2Jxu8F5sIT7P/l3o8HbN7Qg/IigX9u7KXx
         PBWYt2vJO/1FzML47Qy495gNuc9XbUoacu2PELjS6GqbI44LSYgCloCQe7jmWxu+f+B4
         9HSQ==
X-Gm-Message-State: APjAAAUtuGron3Z4RTN/YMbF4xtkyzeYGfonYG+b3ZRfqxg/FibsN0wP
        fTO3cB91K8huO4Bt6WQFVBtfU3jDOJE6akVXd54HVFTvFw==
X-Google-Smtp-Source: APXvYqwdiCg13s1GKG/lWR/+uWU65VhbLDuTzAUreLfGYECTbdTyB16/IEnz9hrKHaFpd6qPNYsri7lPhcZgzUxe1b0=
X-Received: by 2002:a9d:7305:: with SMTP id e5mr103072399otk.64.1578196183259;
 Sat, 04 Jan 2020 19:49:43 -0800 (PST)
MIME-Version: 1.0
From:   Evan Rudford <zocker76@gmail.com>
Date:   Sun, 5 Jan 2020 04:49:32 +0100
Message-ID: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
Subject: Is the Linux kernel underfunded? Lack of quality and security?
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

The problem of underfunding plagues many open source projects.
I wonder whether the Linux kernel suffers from underfunding in
comparison to its global reach.
Although code reviews and technical discussions are working well, I
argue that the testing infrastructure of the kernel is lacking.
Severe bugs are discovered late, and they are discovered by developers
that should not be exposed to that amount of breakage.
Moreover, I feel that security issues do not receive enough resources.

I argue that the cost of those bugs is vastly higher than the cost
that it would take to setup a better quality assurance.
With sufficient funding, the kernel might do all of the following:

- Make serious efforts to rewrite code with a bad security track
record, instead of only fixing security vulnerabilities on an ad hoc
basis.
- Although the kernel will always remain in C, make serious efforts to
introduce a safe language for kernel modules and perhaps for some
subsystems.
- Build an efficient continuous integration (CI) infrastructure.
- Run a fast subset of the CI tests as a gatekeeper for all patch sets.
- Run strict CI tests to ensure that userspace compatibility does not break.
- Run CI tests not only in virtual environments, but also on real hardware.
- Run CI tests that aim to detect performance regressions.

I realize that some companies are already running kernel testing
infrastructure like this.
However, the development process seems to either lack the resources or
the willingness to build a better quality assurance?
