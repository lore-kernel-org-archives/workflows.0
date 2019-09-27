Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F744C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 701BA20872
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfI0SGc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 14:06:32 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:44409 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbfI0SGc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 27 Sep 2019 14:06:32 -0400
Received: by mail-oi1-f174.google.com with SMTP id w6so5932494oie.11
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 11:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qLnYkFrzn78N8+IxtBKZTYmlhIQMYX7b2EVIQMzi5E=;
        b=VhLmwacXyxuGs9vJ6QF3KksKK0NvbYaJZFfIJIHGXApRYJh/wS/jNG66GzV3itaapa
         aSHzVfaumSjzImAgvlN8hYa5K02CatBPc9pCGJuy1TfrmRkZkGV7iXEkOoS5rUsxMRM3
         Tu6FX3wOBebgW5UTAVUarcGD/liKGX36MJFiJ456/RKhspe4Vdc6DD5GZgTrb4sxAUZa
         G8zQBdFfyEXnGsvMlkejC0/r/DLBmG5u1qTQgddNHsFhYezEYusSQ2Y9W4cR/ql8DYKy
         BUUdkakzlidDvz3bHke8GV7BDwGdkXkjX19Fgg93bZ1l7noU19wlyfzGnx2CiIlwN+0k
         bWaQ==
X-Gm-Message-State: APjAAAW+77EIzX9AojGnov8VOPHHyy3oTUenODO3UeWCCfrOrshwYohV
        3xfXjwscBBi6PWWUUWwEuzblXThMYdCYq7ScOtE=
X-Google-Smtp-Source: APXvYqw6/3juiinvI5QTk1gZ51KRyF+cMoaTQuJf/95M2/MG6bLw06HMeKSWsTueCN+kIARRvLc1xFtydDcZCqoVL2U=
X-Received: by 2002:aca:f305:: with SMTP id r5mr7827991oih.131.1569607589822;
 Fri, 27 Sep 2019 11:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190926195143.GA1742392@kroah.com> <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
 <20190927180133.GD1802011@kroah.com>
In-Reply-To: <20190927180133.GD1802011@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 20:06:18 +0200
Message-ID: <CAMuHMdWK8cU56c0B7dUmezCZmCfV6kmFMeqVpzhTvKzSiQTRYA@mail.gmail.com>
Subject: Re: script to check "Fixes:" tags
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Greg,

On Fri, Sep 27, 2019 at 8:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Sep 27, 2019 at 09:49:55AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > Since this list was created to share scripts, here's one that I
> > > currently use to test that the "Fixes:" tags are correct on a commit.  I
> > > run it on all patches that I accept into my trees, after getting emails
> > > from Stephen one too many times :)
> > >
> > > It's almost entirely based on Stephen's original script, but has been
> > > changed a bit in formatting and usage to be a stand-alone script that
> > > anyone can use.
> > >
> > > To use:
> > >         verify_fixes.sh GIT_RANGE
> > >
> > > if all is good, script will print nothing out and exit with success.  If
> > > there is a problem it will be printed out and the script will exit with
> > > an error that you can check from any other program.
> > >
> > > It it 'shellcheck' clean, but I'm sure that there are other things wrong
> > > with it, so feel free to point out problems.
> >
> > Thanks!
> >
> > > And should stuff like this be in the kernel tree itself?
> >
> > Probably this should be integrated into checkpatch.pl?
>
> I can't run checkpatch.pl on everything as sometimes I need to take
> patches that do not pass it :)

Running checkpatch and taking patches are not mutually exclusive ;-)

> checkpatch.pl is supposed to check for s-o-b but for some reason I don't
> think it does all of the checking that my other script does.  Or at
> least I haven't noticed it.

May be true, but it doesn't help to fragment the checking script space.
Just like we just want to run get_maintainer.pl, we just want to run
checkpatch.pl, don't we?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
