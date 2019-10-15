Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D72AECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 307D520650
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KLLKpYib"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfJOQhN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:37:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56850 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbfJOQhJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:37:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C549324;
        Tue, 15 Oct 2019 18:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571157427;
        bh=NyUlTAZ6MtPATiTZ73CRGKHSeCNY4CkKJAAkj4Lpn+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KLLKpYiba9Yhm3iXKhHspznBtOFzkJPfVOf2/b+jMj9JUme7lt8Aw3WLypwOqDM1w
         d6TOK+b/JCHo6XnUCVvVeii3GwE1fGnMP+kWE2bpI0OjojhLYO7ToulgVcKZRfTkAe
         mvUMrWzhuob/fLkSdChV/bag+ENETBvJ9Tlg+YsA=
Date:   Tue, 15 Oct 2019 19:37:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015163704.GJ4875@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu>
 <20191015083741.1d0731e5@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191015083741.1d0731e5@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Steven,

On Tue, Oct 15, 2019 at 08:37:41AM -0400, Steven Rostedt wrote:
> On Mon, 14 Oct 2019 16:56:58 -0400 "Theodore Y. Ts'o" wrote:
> 
> > So it's an extreme case, and is an example of corp e-mail insanity.
> > The good news is that for companies that are really serious about
> > working with upstream, they will roll out solutions for their own
> > customers.  For example, with IBM, since Lotus notes was maximally
> > unfriendly to OSS development practices, they created a separate mail
> > system with ldap@linux.ibm.com addresses be cause it was simply
> > impossible to engage with upstream development using ibm.com
> > addresses.  So there are work arounds, and I encourage you to reach
> > out to other Google kernel developers --- and if you are unhappy,
> > please file internal bugs against the corp infrastructure.
> 
> Note, one issue is that some corporations do not want to support two
> email services. It's hard enough securing one, opening up another one
> is just opening another door to be cracked.
> 
> We do file bugs when there's issues, but that doesn't mean they will be
> resolved. I have special permission to use my personal account, but
> most people at my company do not have that permission, and this is a
> heart ache for those that need to send email via the corporate email
> servers.

But how far could we push this reasoning ? I've worked for a company
whose corporate policy was that all source code had to be stored in SVN,
not exception. I didn't reach the community to move kernel development
away from git. I've also worked with people whose corporate policy was
that they had to do Linux kernel development on Windows, without using
any virtual machine. There are all kind of crazy corporate policies, and
if we don't push the pain it inflicts on all of us back to the people
who enact those crazy policies, we'll always lose.

> Now, if we had a way to send and receive upstream patches via a web
> site, that would actually make things easier.

-- 
Regards,

Laurent Pinchart
