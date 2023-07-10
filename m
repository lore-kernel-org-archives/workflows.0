Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0ABEB64DA
	for <workflows@archiver.kernel.org>; Mon, 10 Jul 2023 18:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbjGJSww (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jul 2023 14:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjGJSwm (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jul 2023 14:52:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABD8100;
        Mon, 10 Jul 2023 11:52:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54FF9611A9;
        Mon, 10 Jul 2023 18:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA5C4339A;
        Mon, 10 Jul 2023 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689015160;
        bh=BORL5nDZuLPZxnG3hgDRFHjODTYIvO9EfLoOyBExHn4=;
        h=Date:From:To:Cc:Subject:From;
        b=Ejw8NqxwdqXGy88SXArq3FztgfPuLze+ULkZtnmCUwKO0C29Msx877eyuGptCEdrM
         3Gbt2PTpkoRNhfdaib5/tyDUn9fTah8vm/gAkFRbTqaKSkC7l3QMeTF3f23SZTZvhO
         kYqAmDqUqoRsHUufoRel0wBAvCmuBmfkvAwKZaYxMbMz2QblNb6zOQ7QfnI0MK7cal
         xP0u1CsiKZ1rJUqKuSYSHZkrNncQ533HanC4I4EWCNkBcxRCWnOCFPCy1C4QF7UK4d
         BYCqrQVeEhFS1VqoDtDYiN+P/w/JPOGoMMtfeAiNl6okPsrBruHotUXMym+bq97xBi
         rJhWbnmMP3fzg==
Date:   Mon, 10 Jul 2023 11:52:39 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     workflows@vger.kernel.org
Cc:     linux-doc@vger.kernel.org
Subject: Docs for base maintainer expectations?
Message-ID: <20230710115239.3f9e2c24@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi,

do we have any docs describing what's expected from folks stepping up
to maintain (small-ish) parts of the kernel like a driver or a protocol?

Experienced developers / maintainers differ like the beautiful
snowflakes that we are, but outsiders have much less familiarity 
with the landscape, and frankly sometimes much less interest in
participating once they code lands.

Which makes we wonder if a simple list of responsibilities would be
useful as a baseline. I haven't spotted anything in Docs/process but
perhaps someone has a local version for their subsystem?
