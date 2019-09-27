Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A471BC4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 19:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F29821655
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 19:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfI0TAu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 15:00:50 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:43213 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfI0TAt (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 27 Sep 2019 15:00:49 -0400
Received: by mail-ot1-f51.google.com with SMTP id o44so3146079ota.10
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 12:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjgufaNNdMIlRV3W1e7zmQUIlYzAhCPzWeX68Qu1gVM=;
        b=kjEGl0u2OPRbTshf85LG1aBFEgm7erSfV52aiIVhB+WSSxacAtEkNhb1ABdkaqSGvF
         WfwTAUbz19bW6pIULOpL45zHbK1TnfZWYukcY9eKGJHuxWd58mGuQ/+TqSt8wWAVH/2J
         v4hztEE03YazgeKbx2iLlnaE8Qqn9gbpAEPeDaHPahm736g6D849QGOgvGKH8t9LsVSm
         1pJmBgrs99kYXuMIKutWpLeIOTzX0yXnqIMSz03cypf4L0iKXUFz1zVbX90XHQhgm2Ly
         pHPokSMGlBIbawnz3y9e7a80kM7UeD/aOq1kS7MxYX/jpyH+EutADDP//hw2kchFZHBG
         V2hg==
X-Gm-Message-State: APjAAAUBAIKGV2y4UGcaA/gP101Le7j0LPeSGiTjl2xw/I3oqBSQHBhq
        12zEkTkNk/30nVVlPMuUiPP782oKLWCvkA2yebRq9bkR
X-Google-Smtp-Source: APXvYqzePCT29nmZ22/ao2O1BnhmkaBUs/Ydsxs+hdwW0HhrGSoIMCFVKqJ3NMEXrndxjU/kb0uJ75w8vGC2AHGlh8E=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr4545382otj.297.1569610848849;
 Fri, 27 Sep 2019 12:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190926195143.GA1742392@kroah.com> <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
 <20190927180133.GD1802011@kroah.com> <CAMuHMdWK8cU56c0B7dUmezCZmCfV6kmFMeqVpzhTvKzSiQTRYA@mail.gmail.com>
 <20190927183557.GA1805907@kroah.com>
In-Reply-To: <20190927183557.GA1805907@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 21:00:37 +0200
Message-ID: <CAMuHMdXFODjJpgbH==PLWsU1KL-7oDXS_u_wMZ99v-KEnt_QKw@mail.gmail.com>
Subject: Re: script to check "Fixes:" tags
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Greg,

On Fri, Sep 27, 2019 at 8:36 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Sep 27, 2019 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Sep 27, 2019 at 8:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Fri, Sep 27, 2019 at 09:49:55AM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > Since this list was created to share scripts, here's one that I
> > > > > currently use to test that the "Fixes:" tags are correct on a commit.  I
> > > > > run it on all patches that I accept into my trees, after getting emails
> > > > > from Stephen one too many times :)
> > > > >
> > > > > It's almost entirely based on Stephen's original script, but has been
> > > > > changed a bit in formatting and usage to be a stand-alone script that
> > > > > anyone can use.
> > > > >
> > > > > To use:
> > > > >         verify_fixes.sh GIT_RANGE
> > > > >
> > > > > if all is good, script will print nothing out and exit with success.  If
> > > > > there is a problem it will be printed out and the script will exit with
> > > > > an error that you can check from any other program.
> > > > >
> > > > > It it 'shellcheck' clean, but I'm sure that there are other things wrong
> > > > > with it, so feel free to point out problems.
> > > >
> > > > Thanks!
> > > >
> > > > > And should stuff like this be in the kernel tree itself?
> > > >
> > > > Probably this should be integrated into checkpatch.pl?
> > >
> > > I can't run checkpatch.pl on everything as sometimes I need to take
> > > patches that do not pass it :)
> >
> > Running checkpatch and taking patches are not mutually exclusive ;-)
> >
> > > checkpatch.pl is supposed to check for s-o-b but for some reason I don't
> > > think it does all of the checking that my other script does.  Or at
> > > least I haven't noticed it.
> >
> > May be true, but it doesn't help to fragment the checking script space.
> > Just like we just want to run get_maintainer.pl, we just want to run
> > checkpatch.pl, don't we?
>
> do we?

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#style-check-your-changes

> Again, I can't do it in my "workflow" at the moment.  This list was for
> people to post what they do and get comments.

You're applying patches from a mailbox folder, right?
So you can run checkpatch against all individual patches in the folder
using:

    formail -s scripts/checkpatch.pl < /path/to/the/mbox/to/apply

BTW, that also applies to patchwork bundles, which is what I started
using recently.

> And a comment of "don't use the tool you have, use something else that
> doesn't do what you really need to do", isn't all that helpful :)

Actually that also applies in reverse, I do use checkpatch.pl ;-)

Use and improve the shared tool that comes with the kernel, instead of
using the one in your cathedral? Unless I'm missing something, that's
one of the general ideas behind this...

> I just noticed that checkpatch can handle a git range, so I'll revisit
> it and see if I can "just test one thing" with it or not, next week.

That assumes the patches have been applied already...
Which is fine for maintainers taking pull requests.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
