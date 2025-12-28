Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47832273D75
	for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950608; cv=none; b=gNNYpgHDrXje0bGCcQEAvd3nOcvoqUNyYCsmKPDY0852r6J35UQ2HGtDK4XOeNejGsaJ0Fg8QQewfIYzhvKAtyAI+msOb23gWVl+UNLNeVEoTWtUjwZ1KUZZYtAvMf2WZF0qWla86KwnH+v5bI6ePqUPEKrnOstst7MGnxuSKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950608; c=relaxed/simple;
	bh=MvgwSe2uuAnSoqmyj7Z6BxaI7PVqfjMSmemWw9nwZVI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNAx6k1dftYduWOrcmgSLynPwrc6FiAmzb/IdHjcCFZXL2Asoi/QmCW2aDvmhpx2F7RvRwM+Y6qOkx5NxsCyPXryGnVxTblV7EzcBhKx6QSwTq7D6xhjzpclf/U+XB3/G0v/0VSweWENpqArXwa3todeU+aPOVhehDQWkG6lV5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo26XEqa; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo26XEqa"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37ce27af365so73820131fa.0
        for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950605; x=1767555405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=Jo26XEqahZZt1bow3phaIBHzxhAzcPRO4iSMWbexkONb+RhC8n0KcHAwwDa8Af2/tK
         pgL46z2qw3F0hEqu67FmoIjIZXaaklT/sglRjO9cPAfOIK7afMAAFIN9Zycs2SgoIfqK
         iTxlxiul5J63SplcntsrpJtIatkbPkYY8zMuKqv+XFKDeF6VDu0bby45iTLt86uPQK/K
         LpAqNcaexCAYpkm4UCybEIJ9cFZ+i1YH62RgRVG1Zk8mOyWY/t6sBeSC9sm7q1+484ai
         aWSK91pcjJocah9bRGmTOjToq0Tt9JZxHtDUmoOo8p9dyFzASrfZjE/c5Dtk8vfaTo/k
         0Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950605; x=1767555405;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=XFGsE/gYv1C/NEnPIPPdElNNMHqyT85V4oQc7fpvPxaj37WTrdFqkp51MGoroWMiC+
         Qrf/19Gmf+13kw6IPN0fbQJn4fiY+0B7feb5txwH7thr38YSCF03ZBNxtNUoftuqzTsL
         ilabYS7myqsYNBHGKsI3j7bH1nICIIekI5fW8qWN3AXte1eWCpZpp78TmxOKQEzxu+z/
         XHLx/m/A1WQVhdMLJTAHD7IN5Xh3oypdhMbazagWuUgP00utAv1UfinOAikkqmG0KgQM
         1W4eLgV5VPrUGbCV0fhcnNM/tPIbcLYbi38K8QytpkukJ8lgZgPfJprHJqnhEiIe90Ae
         kiEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6n8qB5PlNCXU9gYEEvMAZahsDgT3u22iYmEY6puy/hVqdpiKglQiZ0uwVEVP7otVHQEae+nGu6OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmfS4ZHu5OAk9ipVznofgOvMDPAgASQgUW7YHC4ljXQ7CKH9/
	+cS+xh1jrp6i1Fw0Q403igoxW+M0l3XTINw+uJ/5j+IvAOuqmMrEYMlFB+sNSjVcQXN+bwJ4WH/
	P+D+Qgew9RMmNsmXnK4PuIqXIYnFoH6ySVbMk
X-Gm-Gg: AY/fxX5XXJXVYqVoO//V7f9XkaTlh6KjOH6USRN9k30LYjsjzFgqq+1MtdjLVpNPUkq
	8oPTo7ZBFAR0TOhaltoXHSAQUJLz3r5UuuWjGB0MAwDtgEDQ++4lVlUyOFWB9K2CE+TBUu5GVQO
	gsVP6tqB3+PC5gHlewBFE7GTpIDst/yCZK8dEEv90C7eZHR/DgWgNYpmgRGwhfbK7EO0PjKTQtF
	b8cbI+NbHBT1mijL7EbpHULUDeYC5BbGxHT9rYfQBeWjAkJJjj2eFrzCyLv97EVlyVP61JJHqc3
	CMAd
X-Google-Smtp-Source: AGHT+IEB4QizO116wEGtM/TvDrD28jqsY2fAs5pY5yVqGRRrOxCn4rxhxMSU2ASm78Oy6NPp0xHNiycd8NYhq/GICx4=
X-Received: by 2002:a2e:bc0f:0:b0:37b:966a:493e with SMTP id
 38308e7fff4ca-381216fcca6mr97098551fa.39.1766950605367; Sun, 28 Dec 2025
 11:36:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:43 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:43 -0800
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
Date: Sun, 28 Dec 2025 11:36:43 -0800
X-Gm-Features: AQt7F2rxsR2W6BfMALSzXTLl-v-44B4FmN48vWNaW0EojizGDJpCSEaLdTYOeF4
Message-ID: <CAMEXYWdHGz4mdzc2jc7oSdqQPXLtsKktJfi_MZ0GuQRzQhURvQ@mail.gmail.com>
Subject: [PATCH 2/3] scripts: coccicheck: warn on unset debug file
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

coccicheck prints debug logs to stdout unless a debug file has been set.
This makes it hard to read coccinelle's suggested changes, especially
for someone new to coccicheck.

From this commit, we warn about this behaviour from within the script on
an unset debug file. Explicitly setting the debug file to /dev/null
suppresses the warning while keeping the default.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 2efb74afef2b..8dd766009de1 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -260,6 +260,11 @@ coccinelle () {
 }

 if [ "$DEBUG_FILE" = "" ]; then
+    echo 'You have not explicitly specified the debug file to use.'
+    echo 'Using default "/dev/null" as debug file.'
+    echo 'Debug logs will be printed to stdout.'
+    echo 'You can specify the debug file with "make coccicheck
DEBUG_FILE=<debug_file>"'
+    echo ''
     DEBUG_FILE="/dev/null"
 fi

-- 
2.52.0
