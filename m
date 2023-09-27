Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEE0E7F15D
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 04:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjI0EAX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjI0D65 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 26 Sep 2023 23:58:57 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198A01E979
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:28 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81e9981ff4so14943679276.3
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695784767; x=1696389567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DGozN3Q2BjVab5DdC5Xqh5aKsGm98+6kSJqgQyphx4Q=;
        b=wWxxFkNRhyFJrl2HT2Y7HKBAuHEyijl48YBQ4zrpWFFvwamXybQrAjZLJz6FJLS8qs
         9jjNd38wrNAm6nQSX3ceOHEFR9mmPW2oaddv7AX9KqZLoW7Wa8+JIYO1VkA4idV0gtSB
         +9W0zcWejYSxex4PV19AQXMQoolXKulgQYZTNqrWCfs2vwDxBJoI5GtsNJE8vjAtxxiC
         bs4bSMLdiVL5Ov6DK0AE0G0Rr8qDL7qnQt26YhjcZhKOwB/gTTqsjSO0P1FNCwpNMTS4
         kLrC5SjVOFkyzSr43c5pQyLl6TGTRdlsxYLBS0sVSAeXBKFTUEpiTC+BIBs7u7Iddebr
         Gu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695784767; x=1696389567;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGozN3Q2BjVab5DdC5Xqh5aKsGm98+6kSJqgQyphx4Q=;
        b=J3Yx+znSnTAXJHJzk3kO/N8C3NUDjAfzfr2EwSHBB40ZKE6s882Oto2eAaLStxGx1C
         gvecbG7I0Aer69VzSqCCae2/AT93tiuMvTSIeGfCZIzEBOAu8pIK9Z3kHYuqdEqlU8o0
         6Eypmdj3opy7LrskFY5G2ynAnTt5OQzqWJUZrh9VpIzIDiRnNQ/G7x4o4k9dT43NYZDa
         3Rk9bFdxf+n6eO3kfoZSt44g4i5t0KnmtR83lYJwPCvaNeqibG1uN/LFMHg1Yw7QQFku
         a6Zjgkuc6AJF6N+zF/Lsp8P66jQ6oT+x5SWS78ZpwOvDhCBbq2eGnftxmYDVe+0JuWNB
         rapA==
X-Gm-Message-State: AOJu0YwACZ6gmciB6K3T5KD29EIiAU4PNr1uQijhwCpf9fWyis24Tonj
        2Cf2ZnW1Xt47KymEX4HbT+8ClJkKDAoKusUD7g==
X-Google-Smtp-Source: AGHT+IFacMx8GpxVXB6axPpq+vXi8WKy5ZXo2AjxMntJypqIRg0l1HjRPdST6huJcVUl8MLsrqNan5P2YE12nFDdbg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:880b:0:b0:d89:dd12:163d with SMTP
 id c11-20020a25880b000000b00d89dd12163dmr1445ybl.1.1695784767190; Tue, 26 Sep
 2023 20:19:27 -0700 (PDT)
Date:   Wed, 27 Sep 2023 03:19:13 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADGfE2UC/x2MQQqAIBAAvxJ7TrBNsvpKhEhutocsVCKI/p50m
 MMcZh5IFJkSjNUDkS5OfIQiTV3BstngSbArDiixlQN2wlM2u+WQCxSNdc44IbVCZftGkUYo6Rl p5fvfTvP7fozB+mhmAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695784766; l=1608;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Z/OmsHcYrM5MtXvVa9TZMGeFKOHN5xCyog9zO9xwJV0=; b=lPG98gO1n66aeEpHpqKhRK8xSwE9XYPSVvpQeaoQ1BmEHFgA6zvp7wzCceTBEOWUVNotomdWM
 vmWsWEkLWirA9uPCL0HWgUEeGew3+yB6ftxyokDo8HNY/g8F8Kwa6gZ
X-Mailer: b4 0.12.3
Message-ID: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
Subject: [PATCH 0/3] get_maintainer: add patch-only keyword matching
From:   Justin Stitt <justinstitt@google.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

This series aims to add "D:" which behaves exactly the same as "K:" but
works only on patch files.

The goal of this is to reduce noise when folks use get_maintainer on
tree files as opposed to patches. This use case should be steered away
from [1] but "D:" should help maintainers reduce noise in their inboxes
regardless, especially when matching omnipresent keywords like [2]. In
the event of [2] Kees would be to/cc'd from folks running get_maintainer
on _any_ file containing "__counted_by". The number of these files is
rising and I fear for his inbox as his goal, as I understand it, is to
simply monitor the introduction of new __counted_by annotations to
ensure accurate semantics.

See [3/3] for an illustrative example.

This series also includes a formatting pass over get_maintainer because
I personally found it difficult to parse with the human eye.

[1]: https://lore.kernel.org/all/20230726151515.1650519-1-kuba@kernel.org/
[2]: https://lore.kernel.org/all/20230925172037.work.853-kees@kernel.org/

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Justin Stitt (3):
      MAINTAINERS: add documentation for D:
      get_maintainer: run perltidy
      get_maintainer: add patch-only pattern matching type

 MAINTAINERS               |    3 +
 scripts/get_maintainer.pl | 3334 +++++++++++++++++++++++----------------------
 2 files changed, 1718 insertions(+), 1619 deletions(-)
---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230926-get_maintainer_add_d-07424a814e72

Best regards,
--
Justin Stitt <justinstitt@google.com>

