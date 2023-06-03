Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65ECC7EE24
	for <workflows@archiver.kernel.org>; Sat,  3 Jun 2023 15:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjFCPUp (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 3 Jun 2023 11:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjFCPUp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 3 Jun 2023 11:20:45 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 08:20:43 PDT
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51E9123
        for <workflows@vger.kernel.org>; Sat,  3 Jun 2023 08:20:43 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1685805643; x=1685812843; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=XTa4pTN8mA1qs4eZR7hkgbdD55qmi0189Q+ftbOrPYA=;
 b=IokmkBk8Yjwp/KH21IMBHwfQ4aBHf8luw0/wzDaoMeJDS3skL/zu5qXnAbi60s6EF9ticUWJo3N2x5tdb11qHFL8kDSqAFGQW6hPszTU7zf01vAbZ1+Yp6jsf/eDnzgyATmsUhKfgBRjDiPNmBpZZSvCemfYsN4aXXAxfveeAeDNaOYdp17SWoyyedkYeTWo/ikZF0I8TwKw2hzUNTUBaZxxOKUAjHdqX26nuYgvynI06dG9AMMvEBHvAX4CZ4kTeV6CtMeU/BefyqjcUi5J1kOvF9DU4U5WaT3q9G2umhUt/Yp8kibFRL/fTwAGXyyssVK0/VKKlD4R+R+pLjSxvQ==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIxOWZjNiIsIndvcmtmbG93c0B2Z2VyLmtlcm5lbC5vcmciLCI5M2Q1YWIiXQ==
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 54d8775e8f74 with SMTP id
 647b591d2f85f82427c4c490 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Jun 2023 15:15:41 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     James Seo <james@equiv.tech>, Kalle Valo <kvalo@kernel.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC] docs: process: Send patches 'To' maintainers and 'Cc' lists
Date:   Sat,  3 Jun 2023 08:14:47 -0700
Message-Id: <20230603151447.29288-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

The existing wording in the 'Select the recipients for your patch'
section of submitting-patches.rst states that contributors should
'copy' maintainers and lists, which might be interpreted to mean that
patch e-mails should be sent 'Cc' such recipients without any 'To'
recipients at all.

Indeed, this does happen on occasion (and to be fair, examples of the
practice predating the submitting-patches document exist in kernel
mailing list archives). It isn't a problem on the protocol level, as
SMTP itself deals only with SMTP commands (cf. 'RCPT TO'), but
software that works with MIME headers in message text, perhaps in
order to generate those commands, doesn't always handle the situation
well.

At present, when such an e-mail is sent to the vger listservs, the
MIME header 'To: unlisted-recipients:; (no To-header on input)' is
added to it somewhere along the chain. 'unlisted-recipients:;' is a
valid RFC 5322 Group Address, but it (or '(no To-header on input)')
sometimes goes on to cause problems itself further down the line.

For example, in mutt, it can result in the silent removal of all 'Cc'
recipients (e.g. kernel mailing lists) from a group reply, leaving
the 'To' recipient that the original e-mail was 'From' as the only
actual reply recipient [1]. Other issues [2] are possible in other
software [3]. It also bears mentioning that a lack of 'To' headers is
a characteristic of some spam, so such an e-mail may trigger some
spam filters.

To reduce ambiguity and eliminate this class of potential (albeit
tangential) issues, prescribe sending patches 'To' maintainers and
'Cc' lists. While we're at it, strengthen the recommendation to use
scripts/get_maintainer.pl to find patch recipients, and move Andrew
Morton's callout as the maintainer of last resort to the next
paragraph for better flow.

Link: https://github.com/neomutt/neomutt/issues/2548 [1]
Link: https://github.com/python/cpython/issues/83281 [2]
Link: https://github.com/kvalo/pwcli/issues/15 [3]
Signed-off-by: James Seo <james@equiv.tech>
---
 Documentation/process/submitting-patches.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index efac910e2659..53460f3cdc1d 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -231,14 +231,15 @@ patch.
 Select the recipients for your patch
 ------------------------------------
 
-You should always copy the appropriate subsystem maintainer(s) and list(s) on
-any patch to code that they maintain; look through the MAINTAINERS file and the
-source code revision history to see who those maintainers are.  The script
-scripts/get_maintainer.pl can be very useful at this step (pass paths to your
-patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
-maintainer for the subsystem you are working on, Andrew Morton
-(akpm@linux-foundation.org) serves as a maintainer of last resort.
-
+You should always notify the appropriate subsystem maintainer(s) and list(s)
+about any patch to code that they maintain.  Identify them by looking through
+the MAINTAINERS file and the source code revision history, and by using the
+script scripts/get_maintainer.pl (pass paths to your patches as arguments to
+scripts/get_maintainer.pl).  Send your patch e-mail "To:" those maintainers and
+"Cc:" those lists.
+
+If you cannot find a maintainer for the subsystem you are working on, Andrew
+Morton (akpm@linux-foundation.org) serves as a maintainer of last resort.  Also,
 linux-kernel@vger.kernel.org should be used by default for all patches, but the
 volume on that list has caused a number of developers to tune it out.  Please
 do not spam unrelated lists and unrelated people, though.
-- 
2.39.2

