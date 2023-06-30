Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2B0EB64DA
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 07:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjF3HWC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 03:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjF3HV7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 03:21:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CF91737;
        Fri, 30 Jun 2023 00:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C36D1616E3;
        Fri, 30 Jun 2023 07:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24B0C433C0;
        Fri, 30 Jun 2023 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688109717;
        bh=BDmWeEiyVyhxO4weCChminjG1iwLGB4gkzlpA3fDucw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ro8cibij/8i00PC+hOje/CTUUrjN3z3u3p0ROrgVjOyKMTDntZK8Yek4OmjRyDDet
         /B6t+RA1bpLjpmGgUnqyh3smkbpxi01Y+NpezwcTxHDWzfgsouNajhdXmScre6N1Kk
         pNbYFk1lj+pEcramVH47Fbkr7aAI7Ua1A+yVCS94=
Date:   Fri, 30 Jun 2023 09:21:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net,
        workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <2023063030-onshore-ambiance-887c@gregkh>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023063022-retouch-kerosene-7e4a@gregkh>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jun 30, 2023 at 09:14:21AM +0200, Greg Kroah-Hartman wrote:
> The kernel security team does NOT assign CVEs, so document that properly
> and provide the "if you want one, ask MITRE for it" response that we
> give on a weekly basis in the document, so we don't have to constantly
> say it to everyone who asks.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/process/security-bugs.rst | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index f12ac2316ce7..8b80e1eb7d79 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -79,13 +79,10 @@ not contribute to actually fixing any potential security problems.
>  CVE assignment
>  --------------
>  
> -The security team does not normally assign CVEs, nor do we require them
> -for reports or fixes, as this can needlessly complicate the process and
> -may delay the bug handling. If a reporter wishes to have a CVE identifier
> -assigned ahead of public disclosure, they will need to contact the private
> -linux-distros list, described above. When such a CVE identifier is known
> -before a patch is provided, it is desirable to mention it in the commit
> -message if the reporter agrees.
> +The security team does not assign CVEs, nor do we require them for
> +reports or fixes, as this can needlessly complicate the process and may
> +delay the bug handling.  If a reporter wishes to have a CVE identifier
> +assigned, they should contact MITRE directly.
>  
>  Non-disclosure agreements
>  -------------------------
> -- 
> 2.41.0
> 

If there are no objections to these, I'll take them in my tree after
6.5-rc1 is out to make it simpler.

thanks,

greg k-h
