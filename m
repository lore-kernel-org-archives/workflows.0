Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C301E260A
	for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950475; cv=none; b=uP13vO2RGN7N/rfofShXiQdQGavtg2C+pudJU6XnBbh8K4e0pqtPjx9T2eg/SiB2chNcsQpxgQQHIPl70V212EY4CRWKhUx9T2ipIJBCYYg1iYXGs/ewESGen5Iffz+hoUepLhvyfqKjHIBlf1hWfG/uenWPpgE1THD79Nd7pao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950475; c=relaxed/simple;
	bh=xhd8SzaNLSn5n7vZg/YZdNoWCvF2xi7fh63QMmzjZKM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jy1SW8byBX8+qC7WICT4DIsk01mnjcQfREAM8iFs0UCzNncaiL4HFtSVPgpfr5xEfMP1n4sJxtjeIUur6fWrWJjqBTLWB3jnWHqlOaZVhaPvwAFLMcW9kkwIXODAp8tSwGWGknKrl8nOouycctpp2BzUM/U8NGyiNlQgsgid2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYlpPakm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYlpPakm"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37bbb36c990so82394511fa.0
        for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 11:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950471; x=1767555271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=TYlpPakm/NSMIF8GhUQIRTwQKNorpqrvMxC6wmpBVoT21wAwX3WyF+eEuAuvbdG8V6
         ah0S4XTl/q0hf96Vgi+w34NE8VDnLDw5E/4GGeB/eZWA96ZqFYnnNZninGFDkoTQ1CPz
         9sToYB3qq6O68FD+pvbcjV3B+2LRrP0cjL8XHUnB4aESGdHydyuhvSwp9FTLHlAiOH3p
         z8Xf2neHY1Yf6EX0CRehnU5Asufz9/1eX0C+SEttdy0STOY3eSZKUPfH8AjCZMaJjG0y
         TPs5Sw15I+6K4U/9CQpQld/MGkoDcE6rdEKFQV7btB90Z32uu4XbDc401EHb6oGljxdg
         evDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950471; x=1767555271;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=IBhDvKyvdKOUP1J6N5JEuPhoTCFiikZX7N8j+IJFv3qQ24R6s/3K09LRnGMXK8nsEv
         XAzgy3v0F1ecIfM6dj4vfI8QPONhhGqxiJhN7Bd4cUXetQI8aS2p+0/DRnZ3TmLHoAS1
         DtpjxqjDbX289XWg3wneAsYL0RBOF/Y+b/193XU0jE0BNJkemNuC1KrTLbz/V2O7jLxC
         RS7nyrECjMP6xaqca8MRyrgvPTvlR3egi6eqoM5wZUmB80VyFuvcpR/0rhBCgMGPnkR5
         pt+Of21SYqS+QHpZZcbo+ATlYOxh25E24oV60i9j2Dz1/plU3stP0KU6IuUPFVdvbNFD
         kJcw==
X-Forwarded-Encrypted: i=1; AJvYcCX1beTeaNmdQgcvtuWT9WFUuJ9XeHsqm28jORVj1K2M0hZKm5W1QEpg4HdAXDIHIH8vuuuXJp72NhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1VbhD9K6kR06b9HGAkwswHTQBKpR6OipaJ1flH0VCKeQeKDH
	kXNBTedAwQvTP/EhlT+6/IiBI36eHia9tpXg2aSU1evRDO3J6KAeL0ClU6CdJ0UAJN7gFeGUYqI
	Q8uiuvr43PQ3UuJrwhWO5eKi+bbFql9g=
X-Gm-Gg: AY/fxX5I4k5abtKrGCA/8ax1XnIEku2TJh9DAcMoQuEJVF+6ZoLrxmpbcLmS3U8wfTd
	IBR/Ip1pQKycHlnGVIDfkEFj5fmmlQW1KGOplhBc10oe+uTsgwhYUp2/zBg0o5tWWsM9elymf1E
	Nv14pKJ3ydIyDfhmNP2Ogo3S0+umeFFXRx+uLyAOPAkenwpY6wViPze4m7ht6Ns3mHzPTM+Gf/Y
	tGChji2+XVMBMk2QvCtSuB2vUQp4Kxr/qhE2ihEdhOGA6nmOfC9vcd/cUEj+GnmKsBldA==
X-Google-Smtp-Source: AGHT+IHEfNupptHY9trgkQoCzy4+YnV+44PAeznmTGFiKYh8xCsFyOXYgpVdK1HwRf1XgcOE2oXV2up9kfOA+Vtk8dg=
X-Received: by 2002:a05:651c:1443:b0:382:4f57:e8d1 with SMTP id
 38308e7fff4ca-3824f57eda6mr47267891fa.18.1766950471166; Sun, 28 Dec 2025
 11:34:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:34:29 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:34:29 -0800
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
References: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 11:34:29 -0800
X-Gm-Features: AQt7F2rFGI1xRtTM5YKo2WsRWHsFnX_Zg31dsPOSPaG9OTCcg_vrVmKSegd2bmo
Message-ID: <CAMEXYWfY5mP0YzdtLzzD9Twp+kkrfkAEjbv7-Fk80BBsWWF_8Q@mail.gmail.com>
Subject: [PATCH 1/3] scripts: coccicheck: simplify debug file handling
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit separates handling unset files and pre-existing files. It
also eliminates a duplicated check for unset files in run_cmd_parmap().

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 89d591af5f3e..2efb74afef2b 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -138,7 +138,7 @@ run_cmd_parmap() {
 	if [ $VERBOSE -ne 0 ] ; then
 		echo "Running ($NPROC in parallel): $@"
 	fi
-	if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
+	if [ "$DEBUG_FILE" != "/dev/null" ]; then
                 echo $@>>$DEBUG_FILE
                 $@ 2>>$DEBUG_FILE
         else
@@ -259,13 +259,13 @@ coccinelle () {

 }

-if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
-	if [ -f $DEBUG_FILE ]; then
-		echo "Debug file $DEBUG_FILE exists, bailing"
-		exit
-	fi
-else
-	DEBUG_FILE="/dev/null"
+if [ "$DEBUG_FILE" = "" ]; then
+    DEBUG_FILE="/dev/null"
+fi
+
+if [ -f $DEBUG_FILE ]; then
+	echo "Debug file $DEBUG_FILE exists, bailing"
+	exit
 fi

 if [ "$COCCI" = "" ] ; then
-- 
2.52.0
