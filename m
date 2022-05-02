Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6ACC433FE
	for <workflows@archiver.kernel.org>; Mon,  2 May 2022 14:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiEBOVw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 May 2022 10:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiEBOVv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 May 2022 10:21:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3AC17041;
        Mon,  2 May 2022 07:18:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 85E2AB81145;
        Mon,  2 May 2022 14:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7E0C385AC;
        Mon,  2 May 2022 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651501100;
        bh=9d0+SRhCTXh1I97iLO2Qt8sNKus0pEAvu7QeNMFm1vk=;
        h=Date:From:To:Cc:Subject:From;
        b=ECT//X3L/FY8AWdbKZ/l8E6sKBzLwStQ7Pp3jg4R5/c+CGhr2JcZSSAKmcxYsDQHU
         H2cneGVlSmiXiJxlCEzJMMaiHOLPPTDqAJ24elScWzG7dzcUHxyhUbsfcBADEt7gWm
         kAwNwXRQWsBZBxtOstDZiLStlen3yb3WBKlgngIaD7UCWUWmTxAWVh6BoHpm5YFBxZ
         sZamfV2Ihgd9Y4lO6nHw/r/lSV09qiDhpj95K15pCSoUbcu9agqmEiuPktkzw3QTqP
         6+miCYCNNX4dEGmxJBxOpk6dEXT/7zqoqeyB16H9mGsKKa65shlJy8J8QouYAGEexU
         AWv45iaVxCD/A==
Date:   Mon, 2 May 2022 07:18:18 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
Subject: Driver graveyard
Message-ID: <20220502071818.5101c752@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi!

Thomas suggested that it may be nice to create some form of a record
for drivers which were retired from the tree. I think a code-centric
equivalent of CREDITS could be a good idea.

Does such a record already exist somewhere? If not any thoughts on
creating a file storing (Kconfig, short description, commit which
removed the driver)? E.g.


K: DMASCC
D: Hamradio high-speed (DMA) SCC driver for AX.25. Driver supported
D: Ottawa PI/PI2, Paccomm/Gracilis D: PackeTwin, and S5SCC/DMA boards.
C: 865e2eb08f51


I have no idea how to name such a file.
