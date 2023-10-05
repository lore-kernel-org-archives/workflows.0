Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56457E92713
	for <workflows@archiver.kernel.org>; Thu,  5 Oct 2023 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjJEPht (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjJEPhb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 5 Oct 2023 11:37:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E3A35C1B;
        Thu,  5 Oct 2023 07:53:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AC7C116B1;
        Thu,  5 Oct 2023 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696496221;
        bh=pVrbjUBz8B4tQzXARceL2fDR5Lj64WmB0u1Zx7kMTpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2wdIbPWHyAHClvpS9Kyn1G7hcCW1xtL5Cgatcdr8jg9vkdMAkhnpe1F/in0hczCdw
         PzglEJZgEFQEjOws+30EQEUstsEDQelJlPlciv8h3E+D72sFoQ1U9ps6ZwPYyEiP9E
         aWsWESqOXiZw6BC1ZW3OID0jsS/xQuZm07CTUwkQ=
Date:   Thu, 5 Oct 2023 10:56:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Clarify
 prenotifaction
Message-ID: <2023100546-unrelated-trekker-320b@gregkh>
References: <20231004004959.work.258-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004004959.work.258-kees@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 03, 2023 at 05:50:03PM -0700, Kees Cook wrote:
> There has been a repeated misunderstanding about what the hardware embargo
> list is for. Clarify the language in the process so that it is clear
> that only fixes are coordinated. There is explicitly no prenotification
> process. The list members are also expected to keep total radio silence
> during embargoes.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  .../process/embargoed-hardware-issues.rst     | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index ac7c52f130c9..31000f075707 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -25,15 +25,15 @@ Contact
>  The Linux kernel hardware security team is separate from the regular Linux
>  kernel security team.
>  
> -The team only handles the coordination of embargoed hardware security
> -issues.  Reports of pure software security bugs in the Linux kernel are not
> +The team only handles developing fixes for embargoed hardware security
> +issues. Reports of pure software security bugs in the Linux kernel are not
>  handled by this team and the reporter will be guided to contact the regular
>  Linux kernel security team (:ref:`Documentation/admin-guide/
>  <securitybugs>`) instead.
>  
>  The team can be contacted by email at <hardware-security@kernel.org>. This
> -is a private list of security officers who will help you to coordinate an
> -issue according to our documented process.
> +is a private list of security officers who will help you to coordinate a
> +fix according to our documented process.
>  
>  The list is encrypted and email to the list can be sent by either PGP or
>  S/MIME encrypted and must be signed with the reporter's PGP key or S/MIME
> @@ -132,11 +132,11 @@ other hardware could be affected.
>  
>  The hardware security team will provide an incident-specific encrypted
>  mailing-list which will be used for initial discussion with the reporter,
> -further disclosure and coordination.
> +further disclosure, and coordination of fixes.
>  
>  The hardware security team will provide the disclosing party a list of
>  developers (domain experts) who should be informed initially about the
> -issue after confirming with the developers  that they will adhere to this
> +issue after confirming with the developers that they will adhere to this

Nit, whitespace change wasn't documented in the changelog :)

Thanks for this, it matches up with the list rules now much better (that
everyone gets when they join one of these lists), so I'll go apply it to
my tree now.

greg k-h
