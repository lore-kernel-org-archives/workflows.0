Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D31C27C40
	for <workflows@archiver.kernel.org>; Thu, 24 Aug 2023 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbjHXRWq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Aug 2023 13:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242887AbjHXRWU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 24 Aug 2023 13:22:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C79019BB
        for <workflows@vger.kernel.org>; Thu, 24 Aug 2023 10:22:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0820675B1
        for <workflows@vger.kernel.org>; Thu, 24 Aug 2023 17:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39F1C433C7;
        Thu, 24 Aug 2023 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692897738;
        bh=eyaVccBKPhysr0+hHw8kH0j0iqk/Lh65mPKkr4oX9PI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TEcdAtXFyLdCfaSwh145y9XWE/i2eN/fT8m6QTKQBPwZyTqSs5nFuB0Dx0N1VOZVr
         uRl2uEKBzR4gX+Haddw1b4ktRN2cz95YYmqAPF53vmLpYdIvSVow+LyZXBze21WRyf
         9/H2NHLVHEqpl501eSsSjOkY8Ghp6I/NNwmpDhxY=
Date:   Thu, 24 Aug 2023 19:11:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Selective lei filters and replies to old threads
Message-ID: <2023082415-elongated-cogwheel-8465@gregkh>
References: <87ttsxbvqd.fsf@toke.dk>
 <2023081720-wrath-winnings-bb16@gregkh>
 <87msyob551.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msyob551.fsf@toke.dk>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Aug 18, 2023 at 08:02:34PM +0200, Toke Høiland-Jørgensen wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, Aug 17, 2023 at 04:15:54PM +0200, Toke Høiland-Jørgensen wrote:
> >> [0] Side note: if anyone has a nice trick to specifically exclude Greg's
> >> stable patch bombs from this, I would be interested in hearing about
> >> that as well :)
> >
> > I thought those stable patch bombs had a X- header on them, like:
> > 	X-stable: review
> > and
> > 	X-Patchwork-Hint: ignore
> > but somehow it looks like I'm only adding that to the first message in
> > the stable-patch-bomb series.
> >
> > Would it help for me to fix my side and add those headers to make it
> > easier for you to be able to ignore them?
> 
> I don't think it's possible to match on arbitrary headers in Lore
> searches (maybe public-inbox could be taught that?), but it would
> certainly aid in adding local filtering after fetching which would work
> for me as a workaround. So yes, please! :)

Turned out my scripts were broken, and the header I was supposed to be
putting on all stable patches was no longer happening (something changed
in git format-patch's output I think.)

So this should be now fixed up with the latest 5.10.192-rc1 announcement
and emails.

thanks,

greg k-h
