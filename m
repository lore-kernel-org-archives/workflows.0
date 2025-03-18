Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE751E1E0C
	for <workflows@vger.kernel.org>; Tue, 18 Mar 2025 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742342042; cv=none; b=riq7VBq3zkv0rSilDd6rLmDOLqGZxfXpbr4ZMRNCnJvlQVBI1Cgwpv71a6ksLYb42Nxst8XbylavBEUjYQ0zMAw3Wt9E9/J0kARk91KyqnhLjTa1ohNpuPjLeS+rIjWOtYhGKfuvMZXf0NWGUXCpLgOG1nMawl9hmwXQoAN/nMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742342042; c=relaxed/simple;
	bh=6s3Qs5L1iuKpLaScoh3Gez6frhbTlOEd/CDO1ikIfTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gvp/Y1P9+H5+5x5xJTz/qV22zcvkdMvxngDEAZHjswK8ghV/LhCI9c1OlRQx45x++irTjerzklpO1LYpXgOEzdQJw1ywvqM6RUYlPP9WgPPj/khnvFIHtg1taSYS2IxofephYLQ8LK+sgU8ajQzaX8hLSgh75jP1UKP27l/4m1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ammaraskar.com; spf=pass smtp.mailfrom=ammaraskar.com; dkim=pass (2048-bit key) header.d=ammaraskar-com.20230601.gappssmtp.com header.i=@ammaraskar-com.20230601.gappssmtp.com header.b=IvkOv1/J; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ammaraskar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ammaraskar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ammaraskar-com.20230601.gappssmtp.com header.i=@ammaraskar-com.20230601.gappssmtp.com header.b="IvkOv1/J"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e64405b3b9aso1518352276.1
        for <workflows@vger.kernel.org>; Tue, 18 Mar 2025 16:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ammaraskar-com.20230601.gappssmtp.com; s=20230601; t=1742342039; x=1742946839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpLVHFhUJezHBlUSvAzayps7UgNg9CZT+au6AUlGlEE=;
        b=IvkOv1/J+92DUq21UGi/imzrgC/oPTupT6PWG9Q+NUBDO1WK2HrzUOVFRo5yAsn0Tu
         eyIc6VEs/uJu5uzcJqTr35KT+EusydLHILP7vdQV3LjGoHVSkoqlpdeweLNaAVN/xqAj
         JLrclK4rioepxT13+LZFi/tmqQg25pP9eYv0e5t8bEWwNJOUjLhJEf/NQO2EEAhduELT
         zw+vD+3HO/+zAHLZDsRYBqDWa2+oDgRuQutUWYZ8P9AJ2kpzsKV54uGYFKPe0+wAExMH
         QlTkLuh6VBHMZ0dKP0OwkrECOzvOjfFG1QFo+RXob+m7iXSDrosNm7qPilowVEGqL+r/
         xf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742342039; x=1742946839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpLVHFhUJezHBlUSvAzayps7UgNg9CZT+au6AUlGlEE=;
        b=rAFMFJT8POIM1te/tzQgkPl7H3V2n1Bu+Adrq5QBMfKLpjAruuyqtfMq8mTMFXNFGY
         8n5ELClV5+ZpVGkBLBmod/J6/4biqtumv40BLVTdVrfoBvSeJPQXmmOBzfh6YYNW2a1J
         KiO9N5tRX8LQwA+w/CBuiSo7UVVXaUWRt5X9ldHXMSWR7+jAz90UFmDrndu+bqRnOK0D
         TOnY1xtPrd40wuyUZerBo2wFAdAiWEjpFe1ld5KJoGDzfbqPnyXZsP7KfXYiOCVHJhns
         lMWZoonDVzS93c8oN7khjxVo+NrigtFJH7PgSFF2WrDnKTD0lisAmaSSUEREHz6xhap3
         qYrg==
X-Gm-Message-State: AOJu0YzPBZirXhxPCYCQ6GzppdxW4SWImNtu0iphZTPjaw7sc7Jmgce8
	sYYDzqgoLwFTv/lNURn2uzZAYYxzwsKQYxFBYnm6bvuD9QHbBYFm4XBSZHMbjeg3rXRdqttw1Ma
	n2Ds=
X-Gm-Gg: ASbGncswEVVtHUXV2Y1oBvSOUOTsI8+5fu1dc0RO0qowyjE0eUWvd6iU3XhF4SIjz2+
	yqVIWhBBtO/P3kXDNjKYcjrceKxNLM8LqOrbesTed5XwuYS0o1HOt0P1AEQcuMM+AHrxUp+Ljip
	SPvTfPc3hhP6oQhmwTymJWAwsL8YYMfx9TbL9f+Bkd232snFfC6zjrL8VevdOIrXWI/JBNz/WA0
	QTqs1RyZ23p8Y7jX79HdY2aNEeqT329gCaBqP28VCXTojRMeJv1rpyvb+fuTF+GebGVTqA0WExm
	SWOfGu4xBqOd1tYpyUS0H+RnEVe/47ek9/SUx8qdsQyoynryazqgMYd5BqfPSefZRKT/ZZD6qef
	jRKM=
X-Google-Smtp-Source: AGHT+IG/WEEhV0BOLHkXgdUvPig2gaoeo9ufEwNDSHd5kHy5NKYL8mB6/C2jluXB+SC2A4lH/ZQrKg==
X-Received: by 2002:a05:6902:1202:b0:e61:1c56:d65e with SMTP id 3f1490d57ef6-e667b440ef8mr941401276.39.1742342038496;
        Tue, 18 Mar 2025 16:53:58 -0700 (PDT)
Received: from localhost.localdomain (iron.gtisc.gatech.edu. [128.61.241.144])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e64137a28ecsm1720060276.35.2025.03.18.16.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:53:57 -0700 (PDT)
From: Ammar Askar <ammar@ammaraskar.com>
To: workflows@vger.kernel.org
Cc: corbet@lwn.net,
	Ammar Askar <ammar@ammaraskar.com>
Subject: [PATCH] docs: Fix conflicting contributor identity info
Date: Tue, 18 Mar 2025 19:53:31 -0400
Message-Id: <20250318235331.3566174-1-ammar@ammaraskar.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit d4563201f33a ("Documentation: simplify and clarify DCO
contribution example language"), the patch submission documentation was
updated to remove the note about pseudonyms and instead simplify it to
allow "known identities".

The process documentation still explicitly prohibits pseudonymous
contributors. This patch changes the process documentation to line up
with the submitting patches document.

Signed-off-by: Ammar Askar <ammar@ammaraskar.com>
---
I ran into this page when searching for "kernel pseudonymous" and saw
that it conflicts with changes Linus made in the patch submission
document. Figured it might be worth updating.

 Documentation/process/1.Intro.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/1.Intro.rst b/Documentation/process/1.Intro.rst
index c3d0270bbfb3..25ca49f7ae4d 100644
--- a/Documentation/process/1.Intro.rst
+++ b/Documentation/process/1.Intro.rst
@@ -251,12 +251,12 @@ there is no prospect of a migration to version 3 of the GPL in the
 foreseeable future.
 
 It is imperative that all code contributed to the kernel be legitimately
-free software.  For that reason, code from anonymous (or pseudonymous)
-contributors will not be accepted.  All contributors are required to "sign
-off" on their code, stating that the code can be distributed with the
-kernel under the GPL.  Code which has not been licensed as free software by
-its owner, or which risks creating copyright-related problems for the
-kernel (such as code which derives from reverse-engineering efforts lacking
+free software.  For that reason, code from contributors without a known
+identity or anonymous contributors will not be accepted. All contributors are
+required to "sign off" on their code, stating that the code can be distributed
+with the kernel under the GPL.  Code which has not been licensed as free
+software by its owner, or which risks creating copyright-related problems for
+the kernel (such as code which derives from reverse-engineering efforts lacking
 proper safeguards) cannot be contributed.
 
 Questions about copyright-related issues are common on Linux development
-- 
2.25.1

