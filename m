Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB73CCA0FE6
	for <workflows@archiver.kernel.org>; Fri,  1 Sep 2023 08:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbjIAIks convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Sep 2023 04:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbjIAIkq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Sep 2023 04:40:46 -0400
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14AB10CA
        for <workflows@vger.kernel.org>; Fri,  1 Sep 2023 01:40:42 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-W-r-CbQfPi2e9mKkUC7dCw-1; Fri, 01 Sep 2023 04:40:25 -0400
X-MC-Unique: W-r-CbQfPi2e9mKkUC7dCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12482803E2E;
        Fri,  1 Sep 2023 08:40:25 +0000 (UTC)
Received: from hog (unknown [10.45.224.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AEF0492C13;
        Fri,  1 Sep 2023 08:40:23 +0000 (UTC)
Date:   Fri, 1 Sep 2023 10:40:21 +0200
From:   Sabrina Dubroca <sd@queasysnail.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH net v3] docs: netdev: document patchwork patch states
Message-ID: <ZPGjdQOfM2POGoEW@hog>
References: <20230901014131.540821-1-kuba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230901014131.540821-1-kuba@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: queasysnail.net
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

2023-08-31, 18:41:29 -0700, Jakub Kicinski wrote:
> The patchwork states are largely self-explanatory but small
> ambiguities may still come up. Document how we interpret
> the states in networking.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v3:
>  - clarify that patches once set to Awaiting Upstream will stay there

mhmm, the patch looks identical to v2. Did you post the wrong version?

-- 
Sabrina

