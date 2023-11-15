Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D5CC2BB3F
	for <workflows@archiver.kernel.org>; Wed, 15 Nov 2023 20:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjKOUbS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Nov 2023 15:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbjKOUbR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Nov 2023 15:31:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0BDD8
        for <workflows@vger.kernel.org>; Wed, 15 Nov 2023 12:31:14 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7406C433C8;
        Wed, 15 Nov 2023 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700080273;
        bh=EUzq6qp5t7KE2y+Wd+xj6rN7S8y94n72rMoSKlwAgdg=;
        h=From:To:Cc:Subject:Date:From;
        b=DHLbrbTE+HGqsuujOZIqpMdFLC15VVf19Aj5/w4HMhguD5cErAEjS1AbowTp2BwBa
         c+YgL0fZOmRquvRh40i2x3yMQBHAOr2StTK/e0Q4xshFpnoJIehqjJ4KoX8ZTniiKk
         5IES4+9YZzIyYf318C5/qcJui7qLYcSQT34e0fQFEcG2rEs6x+29Qft8xEbjZdheEN
         AyhUKs+Vhf4zRvnSU00WAjX69DxubxSwHN/DUBR/+4rKj1ubOb5dubqjgd8NkOVAKU
         JCkQ5JFXgkhQFufcXOUsmvLLeenCJwNazPMH0N7A5scZyFsf9NBF2GDPpZNbx+/X4m
         H7f/7evrpBrVA==
From:   Mark Brown <broonie@kernel.org>
To:     Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc:     workflows@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH] MAINTAINERS: Require kunit tests for regmap
Date:   Wed, 15 Nov 2023 20:29:24 +0000
Message-Id: <20231115202924.119403-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=broonie@kernel.org; h=from:subject; bh=EUzq6qp5t7KE2y+Wd+xj6rN7S8y94n72rMoSKlwAgdg=; b=owGbwMvMwMWocq27KDak/QLjabUkhtRQLWVu97NVFoYTudvEGad+CGA/NP8f64bqYotfPx8eFuRy kzzWyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMRFKd/a9c0o0nfrmJn5q62ArPfT H5J1/4XEbZrIxjcULrNp9LVdFv4ypCLI9v2bmz7EdSyfSC9S07TnwOmpe9f89MhsTEpTKazb37l8x8 fKKDK2yBzK25fzVE5Fmv2ulPdlDbK2I4v63WN3//jEoBtkoe34vrJtYxGVWueNPCIpH96efjGR2V7n IsNiybpb9cTGNc8mxd4CSZc6JOXbcd4vMzlfdt7mC7ZS4d9u+iwmTRq8oOf9hcfp5ZvdzO8x67h3+W ZJWmV4zkgxMH1FPyC3TdNG4qutw2fPh0aohcn6aezuf9/vVeqVwlSWd2rDV7+HP5x8i927mMKqo0// Hp+zA2Vphum3ye265fJa3Nn68OAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

The regmap core and especially cache code have reasonable kunit
coverage, ask people to use that to test regmap changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---

I'd be happy for you to add this to your series.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cf..aeb6a6d47c79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18356,6 +18356,7 @@ M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
+V:	kunit
 F:	Documentation/devicetree/bindings/regmap/
 F:	drivers/base/regmap/
 F:	include/linux/regmap.h
-- 
2.30.2

