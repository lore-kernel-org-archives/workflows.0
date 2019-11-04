Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E542BCA9EB5
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B91C82184C
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572874932;
	bh=2lI6RODLtkojxLc0mPdgd84WsBvX9raK/Q+Dp/R9UqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YlD3EX/cPX3IlhSvTW+4UhmrsUpua4eE9On5UYey35k1+H6g7AhF9ptOIm69Z+VXL
	 F7U+xPI4mShpk2kBWMIBFFJXIXztkHnYUI5bibvV4mwDiC7OdJoxNsukTQhejLxtox
	 B6yeWmYrKwXu5NVRvk556JHSBCFvF2M204L52CqM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbfKDNmM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 08:42:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfKDNmM (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 4 Nov 2019 08:42:12 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A1C0205C9;
        Mon,  4 Nov 2019 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572874931;
        bh=2lI6RODLtkojxLc0mPdgd84WsBvX9raK/Q+Dp/R9UqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=elvS35CyFQbp6M9E1UD7vTHm5H6XzWd02c2tYoXkINMlZkzJuKEhJD3CvblBGX/xm
         Xd2zMOvNFQ55Xqs0YQPfisNWnCB1MpqVsyxvWfa28kjx8uWd1SfOpgEtkoiaWJEniv
         RD2TgW7YgI+gZf4AC8A9gT+AwnNCBcejbpgtB0tY=
Date:   Mon, 4 Nov 2019 14:42:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Eric Wong <e@80x24.org>, workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
Message-ID: <20191104134206.GA2133491@kroah.com>
References: <20191101022746.GA25491@dcvr>
 <20191101090456.GD2671695@kroah.com>
 <20191104131310.GE28764@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104131310.GE28764@mit.edu>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 04, 2019 at 08:13:10AM -0500, Theodore Y. Ts'o wrote:
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

I'm not going to try to keep such a list up-to-date, that's crazy.  It
usually depends on defaults/configurations as well, so it's not always
the specific program.  Also different versions do different things (like
Mail from OS-X).  So it's just much easier to say, "no attachments" and
then if you really know what you are doing, and you know your email
client will set it up properly, then do it.

Also, Zoho mail, ugh, I never understood how that could always send
stuff out so horribly...

greg k-h
