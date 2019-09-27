Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E60C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC2E5217D7
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569607302;
	bh=xxbooi4NkxcBUHGCSeVAKCPAjS5gqbK5oUZrhjsnk0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=D5SfGtVBkoAHXnZV8PtxRAjUwEwCX/KAzKrTEkeJhWDK7/sIu97UlNrOqQiQAqki9
	 Mn3zgWg8s7KGvXoRv9H8KNXmOk92NkzcumTIJ2cyQoHh+E+uoU+OXrB94iJsVNWHfn
	 BVinFMqeIZUK0q4gJcmI0ez2MBI8QYEapY7rvkt0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfI0SBm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 14:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbfI0SBm (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 27 Sep 2019 14:01:42 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D689E20872;
        Fri, 27 Sep 2019 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569607301;
        bh=xxbooi4NkxcBUHGCSeVAKCPAjS5gqbK5oUZrhjsnk0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ijXvPomxcX73w5u7vNbgfn/hMydSR+Mlf9sAdRHwzyu5YDVKgpEsgeZJdl7C7BvbL
         B8J8dHj4My3E6BX0Cr8w4u/wWPyeyYP3fDgCnHbMFLdjX59HZpn46iSRLnnSG/5T59
         CTDCJ3DmOyeEo1056mgBfiU9WJRb5zEc0pI4dTvw=
Date:   Fri, 27 Sep 2019 20:01:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     workflows@vger.kernel.org
Subject: Re: script to check "Fixes:" tags
Message-ID: <20190927180133.GD1802011@kroah.com>
References: <20190926195143.GA1742392@kroah.com>
 <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 27, 2019 at 09:49:55AM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Since this list was created to share scripts, here's one that I
> > currently use to test that the "Fixes:" tags are correct on a commit.  I
> > run it on all patches that I accept into my trees, after getting emails
> > from Stephen one too many times :)
> >
> > It's almost entirely based on Stephen's original script, but has been
> > changed a bit in formatting and usage to be a stand-alone script that
> > anyone can use.
> >
> > To use:
> >         verify_fixes.sh GIT_RANGE
> >
> > if all is good, script will print nothing out and exit with success.  If
> > there is a problem it will be printed out and the script will exit with
> > an error that you can check from any other program.
> >
> > It it 'shellcheck' clean, but I'm sure that there are other things wrong
> > with it, so feel free to point out problems.
> 
> Thanks!
> 
> > And should stuff like this be in the kernel tree itself?
> 
> Probably this should be integrated into checkpatch.pl?

I can't run checkpatch.pl on everything as sometimes I need to take
patches that do not pass it :)

checkpatch.pl is supposed to check for s-o-b but for some reason I don't
think it does all of the checking that my other script does.  Or at
least I haven't noticed it.

thanks,

greg k-h
