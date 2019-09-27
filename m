Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4CDC4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7078C21850
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569609370;
	bh=Muqh2uGcFM1PtWV8uAa7VT5EmzzC8DezzO2yaRpWjQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2L+mV9hbza3WqX3SW1e5Tr7bFfQrKLbMHd5RnpDoRUJW5YxitaKR2Hadh8N+xOWix
	 gP+Ga69aJp1RuMlFHM0RSqOA2PaDcSd4aJCHqlw8Ip2u/fcU3DlHFb/OEWI/9nfx1V
	 nNUJ910sMbw5LTwnUJtWuKzffqwCApwyzpKIpumc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfI0SgJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 14:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbfI0SgJ (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 27 Sep 2019 14:36:09 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC403217D7;
        Fri, 27 Sep 2019 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569609368;
        bh=Muqh2uGcFM1PtWV8uAa7VT5EmzzC8DezzO2yaRpWjQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PZnbS0DmdBThjrpG2CNx7PqsgtjIOhPy+Fbk6TKqLsla1//7npTAWPOpZrhSh3DX4
         sO9Ls6j+xZC29IgRDC18kJW+Ba6yetBtDLN2030YGx5Hj1W150r1G8z0NAjBQrXkwN
         HmlI+QyLujRTpupRiLAXmbJyuac+27yF6mpC9hXo=
Date:   Fri, 27 Sep 2019 20:35:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     workflows@vger.kernel.org
Subject: Re: script to check "Fixes:" tags
Message-ID: <20190927183557.GA1805907@kroah.com>
References: <20190926195143.GA1742392@kroah.com>
 <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
 <20190927180133.GD1802011@kroah.com>
 <CAMuHMdWK8cU56c0B7dUmezCZmCfV6kmFMeqVpzhTvKzSiQTRYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWK8cU56c0B7dUmezCZmCfV6kmFMeqVpzhTvKzSiQTRYA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 27, 2019 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Sep 27, 2019 at 8:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Fri, Sep 27, 2019 at 09:49:55AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > Since this list was created to share scripts, here's one that I
> > > > currently use to test that the "Fixes:" tags are correct on a commit.  I
> > > > run it on all patches that I accept into my trees, after getting emails
> > > > from Stephen one too many times :)
> > > >
> > > > It's almost entirely based on Stephen's original script, but has been
> > > > changed a bit in formatting and usage to be a stand-alone script that
> > > > anyone can use.
> > > >
> > > > To use:
> > > >         verify_fixes.sh GIT_RANGE
> > > >
> > > > if all is good, script will print nothing out and exit with success.  If
> > > > there is a problem it will be printed out and the script will exit with
> > > > an error that you can check from any other program.
> > > >
> > > > It it 'shellcheck' clean, but I'm sure that there are other things wrong
> > > > with it, so feel free to point out problems.
> > >
> > > Thanks!
> > >
> > > > And should stuff like this be in the kernel tree itself?
> > >
> > > Probably this should be integrated into checkpatch.pl?
> >
> > I can't run checkpatch.pl on everything as sometimes I need to take
> > patches that do not pass it :)
> 
> Running checkpatch and taking patches are not mutually exclusive ;-)
> 
> > checkpatch.pl is supposed to check for s-o-b but for some reason I don't
> > think it does all of the checking that my other script does.  Or at
> > least I haven't noticed it.
> 
> May be true, but it doesn't help to fragment the checking script space.
> Just like we just want to run get_maintainer.pl, we just want to run
> checkpatch.pl, don't we?

do we?

Again, I can't do it in my "workflow" at the moment.  This list was for
people to post what they do and get comments.

And a comment of "don't use the tool you have, use something else that
doesn't do what you really need to do", isn't all that helpful :)

I just noticed that checkpatch can handle a git range, so I'll revisit
it and see if I can "just test one thing" with it or not, next week.

thanks,

greg k-h
