Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE2FC5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54BCF222C2
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Emji0zOG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfKHOZP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:25:15 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34133 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKHOZP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:25:15 -0500
Received: by mail-qk1-f195.google.com with SMTP id 205so5424078qkk.1
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8V80++hs6Hul6foEri4lGGidO49Dti2nV8GtMq6ZIec=;
        b=Emji0zOGgEpmUdUJPzZcbY5CyNSMUq1GqZXm2MvRcHtcvyF9rxmX3EI0o37bGy74xS
         lzxlYUkUQgMD6r+iTHsaxCXubhlJMZd+Nt2R9Du5dRoDbXyPqqkoxaCDWOZdY+rfz4gv
         EFbz5oR86kyKTAoDg6NRicZZjS+q4yFu0m6jFiTzwxG0QCH5MLpyh9k4tQcYAmDlo5ZO
         AQAmHUQq4KaFKl4HVfbyCjCt8IG7h7KTSj2mALM0EbPXQcn6guK8VkBCAG+EruSSB+x8
         zqQA4Bn59w8rThfg0L4e/Kp/mIEZWe5i7aGWqR63pqJEVCmyrQN/sM0GONrt3BfBkhvZ
         T0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8V80++hs6Hul6foEri4lGGidO49Dti2nV8GtMq6ZIec=;
        b=n5AYFZPbjqw97njBcpp0KBxxYMaUrVNFVkinZuXXQkwh+XSI+csgPy68OzmYIjmEwB
         Zx4pbTucew24ugIVorMlhUVvWJJsLnxlG6kvIwWw+IrMLB9rIoWjWz006EpMSyDO3SUn
         0L2aegFXAgmL2NiJMUTmilez+lvLA6Ab4J/h4rH/0TeFD/09m+2rxmCSY1iiWyqVC+F+
         0P1sLrplr9870KjeRO6FgEkvtUO9E08K255NmWB0onZvC0266uFQeLaJMUrrJkrPKeIV
         q1l60OPtMMAzmX14hPpN40Ay4WJjPyTrE/aDSyV+GFLGFViAcL+Hg5EYDJBy2qqcC7Zz
         AlVg==
X-Gm-Message-State: APjAAAWUZQRh6ZXyYL2KcEn2HvfkkqYRe3WkN0Vh4mspUqnWIT02titP
        nFcSeHCqr0Q9hVP7J27+MacbQt0xnCLPo+rp3ilAww==
X-Google-Smtp-Source: APXvYqwbz5egCy92equF6Shds12tkzGxx98Rmd1vsrwaGDJrWMkoA2HFreks9PJD9223OjwiJ0DVpqbqs39SIcLCyDg=
X-Received: by 2002:a37:6156:: with SMTP id v83mr9165856qkb.43.1573223112885;
 Fri, 08 Nov 2019 06:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu> <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com> <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
In-Reply-To: <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 Nov 2019 15:25:00 +0100
Message-ID: <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 8, 2019 at 3:17 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Nov 08, 2019 at 03:12:51PM +0100, Dmitry Vyukov wrote:
> > Just to clarify: syzbot does not do this on purpose. It generates and
> > hands off unwrapped lines. The "format=flowed; delsp=yes" part was
> > done by somebody else.
>
> Looks like vger received it already mangled:
> https://lore.kernel.org/linux-usb/000000000000c460630596c1d40d@google.com/raw

It has the format=flowed; delsp=yes part:

Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Which according to https://tools.ietf.org/html/rfc3676 seems to mean
that that line is not wrapped: new line and 1 space needs to be
removed as part of decoding it.


> Would you like a mail sending account so you can use mail.kernel.org as
> your outgoing smtp? We promise we won't do anything that nasty. :)
>
> -K

You know that we also serve Fuchsia, Akaros, FreeBSD, NetBSD, OpenBSD
and potentially Windows and Darwin in the future, right? :)

How does that work? Currently we just call mail.Send:
https://cloud.google.com/appengine/docs/standard/go/mail/reference
and it magically does the thing. I can't even setup my own email
client, so don't expect lots from me :)
