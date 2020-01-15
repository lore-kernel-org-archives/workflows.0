Return-Path: <SRS0=X7UR=3E=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1D1C32771
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 23:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D34512075B
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 23:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkP+Ozlc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgAOXD7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Jan 2020 18:03:59 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:46591 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOXD7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Jan 2020 18:03:59 -0500
Received: by mail-io1-f50.google.com with SMTP id t26so19667428ioi.13
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2020 15:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Mo9wt6K19J9tSkopiox8G8pcyWP24EhIWIaSFaL87Eg=;
        b=GkP+OzlcopvUqsNqH/1+QNncyg1xhYdVzsR+5o8IZ1YipCeyBeBB8eYsfdJQ3K3szr
         Bqg4mmn39EQgsH2uoWMJ5SQw6yGXk64z1pKZJwpDBMajcccuz7BZJw+CaXao6H2NK8Ik
         OKPyfxK2/wQ+A4iljbjyPs1d4z78n8k/ZQqcBknDX7/IgDf0CYsGZuV8Ql7W543WC4v/
         spjvbgpLjOECmWNHVlX2jztsXJbGyZVvq2ffqoDHnA6otR6mf+LPa4/IrqQXq1K0m7mT
         P/CAZkzsY5lsGgvc7dQ6MaGSDLLudVfKZeUKOM7hJATV//I/8JNwWcg4C/zyqM8tiaz+
         uyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Mo9wt6K19J9tSkopiox8G8pcyWP24EhIWIaSFaL87Eg=;
        b=nM/gcxtvuJijdHZ56rdiyRvv7tD0/jgvi73gCK3SQaejs1g50fXdlJmiTxJpClA/QT
         9EvZQ05iBP/ebNSDSw8V9giOOwIBef9wVd9M2VZ2MhchemkbEFmIZ+hqUkdqfqa57Ngr
         9YlKP3xU9hN3kQMnfvY/60uPuPHAlQsGXmJ3kZ4CQ8Zta75zhtzCrrcw9NIt0JE1pyPj
         WEZOd5DnqXQcirckVhq8XJzK+6ywv6A7GSM0Y//eSeesChSxfMME+gfTzi7CKgm2+uIh
         NvD+MXiQNrLJenVflDLG3FjmFIabvmRfVrHuKrtYjfGiWZcRYHmX84MDHxwdORxopaW0
         VRHQ==
X-Gm-Message-State: APjAAAU7OzkllHIsGLYfQc2G4Uf4E4/BEyvANLPTMWf9TmPINmL2tSJr
        T8IgJVonucqvwt0oSOzHETw/DYUGgRY8pfUz5yg=
X-Google-Smtp-Source: APXvYqw06rKxtj00NdLtR5GtUmggUYeODCx7D0adww7HQmWNXYCWlhmiZLijUztqVAgSgkTZt1mR7yC+n9Yxkol00xE=
X-Received: by 2002:a05:6638:a31:: with SMTP id 17mr25075299jao.15.1579129438446;
 Wed, 15 Jan 2020 15:03:58 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
In-Reply-To: <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Wed, 15 Jan 2020 17:03:47 -0600
Message-ID: <CABhMZUW5O3nMJFh+D0cTVt6jviAQw8eC+0Kx7_w38h+dRVTuxw@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jan 15, 2020 at 4:07 PM Michael Turquette
<mturquette@baylibre.com> wrote:

> I added the first entry, "Bidirectionally sync Patchwork patch status
> with Gmail labels". Stephen Boyd and I use a local solution to
> coordinate patches in the Linux Clk tree. Our solution requires
> Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> proposal is to remove the Notmuch requirements and teach Patchwork to
> talk directly to Gmail (and vice versa), perhaps via a solution in the
> cloud, running on a server somewhere, and not dependent on the uptime
> of my laptop.
>
> From my discussions with kernel devs, I believe there is a reasonably
> sized Venn diagram of people that use both Patchwork for patch
> tracking as well as Gmail/G Suite for email. Having those two talk
> might mean that I never have to use the Patchwork web interface again,
> a big win IMO, and I can just use email.

That's a really cool idea.  What do you do about the Gmail/plain text
problem?  I know Gmail *can* sent plain-text email, but you don't have
much control over the formatting, and I really don't like reviewing
code in a Gmail draft.  I hate to admit it, but I'm always bouncing
back and forth between Gmail and mutt.
