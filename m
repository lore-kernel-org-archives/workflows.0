Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0DBC00528
	for <workflows@archiver.kernel.org>; Mon, 17 Jul 2023 14:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjGQOiF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 17 Jul 2023 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjGQOhv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 17 Jul 2023 10:37:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9A6E60;
        Mon, 17 Jul 2023 07:37:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 31A0D610A7;
        Mon, 17 Jul 2023 14:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A82DC433C7;
        Mon, 17 Jul 2023 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689604669;
        bh=2r0sll+s0IDy8bTc7YEbr58iDiN4CqkfNKcW4JXgjNo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q36eFDp2S55Uz3SGh9XpDRKshan0KQuW4SsGfDkGUd3gdtRMaGjBGClRcWqJedQLW
         94YlB3S2VU7KqhljCOksy9V/PP+vbfVVDavv1H4nxsWs1Kng77cxegWwkf288YJGuD
         BQit2h1PmgEgP/M6u3OhPMNkUmXnIIG3WLuviGJM=
Date:   Mon, 17 Jul 2023 16:37:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <2023071759-visible-identify-e5d7@gregkh>
References: <20230713223432.1501133-1-kuba@kernel.org>
 <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
 <20230714101028.337fb39a@kernel.org>
 <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
 <895ed8ae-e93f-b296-330e-356cda698de2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <895ed8ae-e93f-b296-330e-356cda698de2@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Jul 17, 2023 at 09:49:09AM +0200, Krzysztof Kozlowski wrote:
> On 15/07/2023 12:31, Linux regression tracking (Thorsten Leemhuis) wrote:
> > [CCing other people in the thread]
> > How about something like this:
> > 
> > ```
> > Bug reports
> > -----------
> > 
> > Maintainers must ensure severe problems in their code reported to them
> > are resolved in a timely manner: security vulnerabilities, regressions,
> > compilation errors, data loss, kernel crashes, and bugs of similar scope.
> > 
> > Maintainers furthermore should respond to reports about other kind of
> > bugs as well, if the report is of reasonable quality or indicates a
> > problem that might be severe -- especially if they have *Supported*
> > status of the codebase in the MAINTAINERS file.
> 
> I like mentioning the "Supported" part. We should be a bit more
> understanding to all folks who are not paid to do this.

And, we should not be as understanding for companies who do NOT allow
their developers to do this on company time, so pointing out the
difference here is good, as most of the time it goes unnoticed as to
just how little companies allow their maintainers to do their work.

thanks,

greg k-h
