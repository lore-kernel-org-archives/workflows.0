Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A27EB64D9
	for <workflows@archiver.kernel.org>; Mon, 10 Jul 2023 17:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjGJR2e (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jul 2023 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjGJR23 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jul 2023 13:28:29 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D765C7
        for <workflows@vger.kernel.org>; Mon, 10 Jul 2023 10:28:28 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qIugV-0000ha-4O; Mon, 10 Jul 2023 19:28:27 +0200
Message-ID: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
Date:   Mon, 10 Jul 2023 19:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        Linux kernel regressions list <regressions@lists.linux.dev>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Bugbot for all kernel bugs?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1689010108;eb834e3e;
X-HE-SMSGID: 1qIugV-0000ha-4O
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin. Is there any hope that bugbot will be usable for all
kernel bugs in bugzilla.kernel.org soon? It sounded some weeks ago like
that wasn't too far away, that's why I wonder if we might have arrived
at a point where this support could be enabled.

Sorry for bothering you about this, but I'm getting a bit tired by all
that tedious man-in-the-middle between reporters and developers to let
one group know about things the other did...

Ciao, Thorsten
