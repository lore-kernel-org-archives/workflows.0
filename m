Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AE3CA9EB5
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2E0621D7D
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnJRLYoB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfKDNXr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 08:23:47 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40152 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfKDNXr (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 4 Nov 2019 08:23:47 -0500
Received: by mail-qt1-f195.google.com with SMTP id o49so23819063qta.7
        for <workflows@vger.kernel.org>; Mon, 04 Nov 2019 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Hf82UhKLGuROjcA0fmh91Iuys2bzdzmPWjxl0CdWdY=;
        b=lnJRLYoBdnod9vSR/1xtMZD7We32j+GWkrKsH28RKPaCtSzBRfhiiI2VTPdjh3Y/YV
         WnzGktDzQr08HOd36kz4DzYvGLsMpskHnqz1gKpEeGs8L7x2gk/6DTuAUpywZuE63uxp
         qY7q1g4FTpEG8kuQN98IGfHbnQJeaIMOVG7Is0xDzKun3SsscZ+uf5T5bFXgEqK38ICg
         6OxsmFrX3yiUreNeCMiDbtVYsvZi9PxHoloDol6UzhSCH18BrKf8L3AQ1lewJoo0HoMS
         vQID4HlosLLKNkoucWiMl1AQ37nqcDT+rXgl/4uFb04IRDza+jlcMsBvAVEdaCywZWb8
         bm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Hf82UhKLGuROjcA0fmh91Iuys2bzdzmPWjxl0CdWdY=;
        b=Jo8QqMue/ItdaVeS2MS2EQMIXm6XOrvg8LhQKUvny+xUw94OOKW6eSRzufODCL0m/B
         y+sHQHq9js1TxH3NsxIAYzDIOpft6vxuNHkcmvE5+kpD0o1Dz4bVcXo+o4LWYL3cvrxj
         VN6TdD+qb17V1Wz3shrw+OrYpu8hxnLsc70ZnGC7xzD+9O6cTJo6GYYoMe9QZvc1ojGJ
         mz3DM0yaB7BRLhRzQRxaB7jbCuDZz7f47QR0s52f3d/zr/3smwwn3+j11ByxHpSVqOH5
         6tZekPe8WBC89r1D3Kvg6IYxOgMDmlv9walp3a/8GvphQwg8cc+ADfziR5VeAYMCGeLP
         a+NQ==
X-Gm-Message-State: APjAAAUrdmABzY5CLMI4IU74aHm2WOknq+HwufB2kRaqaL3Hadvmcxem
        K/uFR5RNVzf7W3GrhMHZOzNlLYwFqoKYMMvyoe0zEw==
X-Google-Smtp-Source: APXvYqyLLpLPptwc/3S4CQiu+1i1bse7bXQQK2ZUxD9FGGNOTtaPo0HQQs5Jl8RivnKaCthWOFutskmSDNm4aVKot+M=
X-Received: by 2002:aed:24af:: with SMTP id t44mr11853767qtc.57.1572873825759;
 Mon, 04 Nov 2019 05:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20191101022746.GA25491@dcvr> <20191101090456.GD2671695@kroah.com> <20191104131310.GE28764@mit.edu>
In-Reply-To: <20191104131310.GE28764@mit.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 4 Nov 2019 14:23:33 +0100
Message-ID: <CACT4Y+atKXTqfjSCjzhf_P0MT+fQT-vP90nfct__BaiF2qiK0A@mail.gmail.com>
Subject: Re: patch attachments still unwelcome?
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, Eric Wong <e@80x24.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 4, 2019 at 2:13 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Nov 01, 2019 at 10:04:56AM +0100, Greg KH wrote:
> > > So the documentation in the kernel advising against sending
> > > patch attachments seems hypocritical.  Changing the kernel docs
> > > allow patch attachments could be a good start to making life
> > > easier for contributors without SMTP or IMAP access.
> >
> > It's not hypocritical, as lots of email clients still get this wrong and
> > make responding to attachments almost impossible.  Many do get it right,
> > but trying to document the differences here is quite difficult (I tried
> > once, gave up as it was a mess).
> >
> > > Are many MUAs still incapable of handling them?
> > > mutt shows text patches inline, at least.
> >
> > For most MUAs that send them, yes, but not for all.  I know of at least
> > 2 that send text attachments in formats that mutt will not show it
> > inline, nor allow responding to them properly.  MacOS Mail is one easy
> > example to point to as getting this totally wrong.
> >
> > So, if you know what you are doing, yes, this is fine, but it's still a
> > good idea to say "please do not do this" to make it easier for people
> > just starting out.
>
> Perhaps we should explicitly explain this and then include a white
> list of MUA's that can send text attachments safely/correctly?  (e.g.,
> if you are using the following MUA's, using text attachments are OK;
> if you are using the following MUA's, it will definitely NOT work;
> with all others, proceed with caution.)


One thing that wasn't clear to me when I implemented syzbot is that
some people see attachments inline. syzbot included whole kernel
config and 1MB of logs as attachments, I assumed that other people see
them as, well, attachments. So that may be worth documenting as well.
Though, I did not know that document exists as well, so it would not
help me...
