Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F501C83F14
	for <workflows@archiver.kernel.org>; Mon, 28 Aug 2023 19:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjH1TGR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjH1TFw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Aug 2023 15:05:52 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9D2E0;
        Mon, 28 Aug 2023 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=xkhA18b/HI2p84vEFmfzC1lj/4noW4sLrAyRAOLe3/0=; b=FM4eN16lx/l4Y9TiOmq2fcBiV8
        OUv/ZfMBCx/496RH/k5ZIxfk6gHVTg9Y7qqfcVUvQo/1rqOmpTSYsYeKT7IQSpVHOFjhsqAaxMyfZ
        SHviAj7WDt3iWJ6GpxrG2e35ZFv3F3m99EAvQO+sRr4Bvw20hc/BDdaDvdqYche26OiumoKS9xM7C
        ETG1pgqG+cBHOi6n8b447ja54rg0P4RpeAUnH9MlorqEy+uAoX5AKbQTIYoE8Nfu2K9ciSSBf55ZU
        dXkK8VzH/D467P0zs9xywkPCRB0moH4sYbycvztygvDLJucbJNm325cDNkQpE+iEO8sNH4Bf5bEtN
        TRzI5xEw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qahYX-00A7gm-24;
        Mon, 28 Aug 2023 19:05:45 +0000
Message-ID: <5b7d9eff-cc95-fe37-6762-ef08e153213c@infradead.org>
Date:   Mon, 28 Aug 2023 12:05:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next] docs: netdev: document patchwork patch states
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230828184447.2142383-1-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230828184447.2142383-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi,

On 8/28/23 11:44, Jakub Kicinski wrote:
> The patchwork states are largely self-explanatory but small
> ambiguities may still come up. Document how we interpret
> the states in networking.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/maintainer-netdev.rst | 27 ++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
> index c1c732e9748b..5d16fbb93d25 100644
> --- a/Documentation/process/maintainer-netdev.rst
> +++ b/Documentation/process/maintainer-netdev.rst
> @@ -120,7 +120,32 @@ Status of a patch can be checked by looking at the main patchwork
>    https://patchwork.kernel.org/project/netdevbpf/list/
>  
>  The "State" field will tell you exactly where things are at with your
> -patch. Patches are indexed by the ``Message-ID`` header of the emails
> +patch:

                                                      of the patch's email.
?

> +
> +================== =============================================================
> +Patch state        Description
> +================== =============================================================
> +New, Under review  pending review, patch is in the maintainer’s queue for review
> +Accepted           patch was applied to the appropriate networking tree, this is
> +                   usually set automatically by the pw-bot
> +Needs ACK          waiting for an ack from an area maintainer or testing
> +Changes requested  patch has not passed the review, new revision is expected
> +                   with appropriate code and commit message changes
> +Rejected           patch has been rejected and new revision is not expected
> +Not applicable     patch is expected to be applied outside of the networking
> +                   subsystem
> +Awaiting upstream  patch should be reviewed and handled by appropriate
> +                   sub-maintainer, who will send it on to the networking trees
> +Deferred           patch needs to be reposted later, usually due to dependency
> +                   or because it was posted for a closed tree
> +Superseded         new version of the patch was posted, usually set by the
> +                   pw-bot
> +RFC                not to be applied, usually not in maintainer’s review queue,
> +                   pw-bot can automatically set patches to this state based
> +		   on subject tags

Nit:
Above line uses tabs for indentation. All other lines here use spaces.

> +================== =============================================================
> +
> +Patches are indexed by the ``Message-ID`` header of the emails
>  which carried them so if you have trouble finding your patch append
>  the value of ``Message-ID`` to the URL above.
>  

Thanks.
-- 
~Randy
