Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03545CA9EB5
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFD8D21D7F
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfKDNNU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 08:13:20 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:38338 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728188AbfKDNNU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 4 Nov 2019 08:13:20 -0500
Received: from callcc.thunk.org (ip-12-2-52-196.nyc.us.northamericancoax.com [196.52.2.12])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA4DDDTJ005863
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 4 Nov 2019 08:13:14 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id C0D63420311; Mon,  4 Nov 2019 08:13:10 -0500 (EST)
Date:   Mon, 4 Nov 2019 08:13:10 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Eric Wong <e@80x24.org>, workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
Message-ID: <20191104131310.GE28764@mit.edu>
References: <20191101022746.GA25491@dcvr>
 <20191101090456.GD2671695@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101090456.GD2671695@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 01, 2019 at 10:04:56AM +0100, Greg KH wrote:
> > So the documentation in the kernel advising against sending
> > patch attachments seems hypocritical.  Changing the kernel docs
> > allow patch attachments could be a good start to making life
> > easier for contributors without SMTP or IMAP access.
> 
> It's not hypocritical, as lots of email clients still get this wrong and
> make responding to attachments almost impossible.  Many do get it right,
> but trying to document the differences here is quite difficult (I tried
> once, gave up as it was a mess).
> 
> > Are many MUAs still incapable of handling them?
> > mutt shows text patches inline, at least.
> 
> For most MUAs that send them, yes, but not for all.  I know of at least
> 2 that send text attachments in formats that mutt will not show it
> inline, nor allow responding to them properly.  MacOS Mail is one easy
> example to point to as getting this totally wrong.
> 
> So, if you know what you are doing, yes, this is fine, but it's still a
> good idea to say "please do not do this" to make it easier for people
> just starting out.

Perhaps we should explicitly explain this and then include a white
list of MUA's that can send text attachments safely/correctly?  (e.g.,
if you are using the following MUA's, using text attachments are OK;
if you are using the following MUA's, it will definitely NOT work;
with all others, proceed with caution.)

					- Ted
