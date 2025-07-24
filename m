Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F71FBE87
	for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341657; cv=none; b=jFcmO5X+Lxrzuf1ISnkDjfliuR2dz0VeyeprQorE6FKFHI0IPzdLk/92glLwuhmPqEhRip69MWCa5S/AP0Bwu545iLSzti1KQWvZIWt82ns5eAFjEbaffrDhQPuG5mBJq3i1EgB9twVOFGujXtBXfaHC5tdAyEs8asm3GgGzjWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341657; c=relaxed/simple;
	bh=4NHFOrnlJxQrpWKVDw/v6IQ1txu4TtPqma6pCCMo7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfMEr+ZxMCV3yN8/cqtKdOWhpJrIOLQtgZordeK7dQw6y/Ln+r4LjMz7nmnoEnXFQ4VmV8F6lXgxJGscO7fuYAC/bZ7A+pjd2JETs5jJhyU06Yija5LwMsJhM1hMH1FIBoUJzejxL4c60xTjLxy4AGnmNiXTbeEU0eEuBPh84pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=s8jNm+X1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="s8jNm+X1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so674706f8f.3
        for <workflows@vger.kernel.org>; Thu, 24 Jul 2025 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753341652; x=1753946452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=s8jNm+X1lhGTKwKpyoL2ZYDc2ZfEldwQCKHTBf/VTBLPW3cs6UNLK5FzJELejo2c7Y
         OT7vKjw/h6BPBpJlE7GpFPV8exrOBCv2wfdQDv4FE7xg0XeR4+PBMsa8Q3Qc4ar7fEgL
         ltWXoSNji4J3RJpn3EoBYAD2pMJYlncIIBYrCqu45lzxe8AeFjtt2hmNIXNDqLc8FdxO
         hU1/6oDZKyh3GLaKIihVy4tm+vk1tdjZ5fDgEpaYcukPha/VQhAMCMri8EyWsLVjkQnj
         wYPYeUU7mZ0WEHoXEEHJ1ROmSXF12bbhfcHlEHSLc4vMqk4DUQjUnuX0JZtpSdfZ08kR
         azuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341652; x=1753946452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=bhG/3QT4HjdT8i46qfBU0vw1Vyvt/NfkxTCDMwrVF3ZJ9r0hWetkWek1XQ3ery5lFe
         +lOy1RczI5u4+NJIBQ4BiGGcwIChc/UZWmrjWH+zJ6GTD1yJLz8C+vki0+RGcTS/3nRC
         FW/qolGjrrTeTQ2bgULtv39op4qQI+4rm6wtBTmnGPW/NqIHmGopo8Qw4WjEYFmE5J3o
         6d4MIDZF5vkUPbhy8AoB1USpvSIjiByBnfCNBvf64kTFkusBHseuPr+WTcw91vBKBbnK
         Rgq89PF+1OVomdUg8ziQze8XVg6TVjgF+9sRac/bW7qtJrVrFBjGIrA8Jn2thoUmPspA
         MarQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDWxYbLAyo7ingd3g2BtB5clgjLvmqY8eskP8rmE+ayuBrxyqYEES4vc+S7GIpbC2W5jqW3pnXzXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5hTtfXt4rK/42AIX6dug+b0XyawCIACtgt5SIvrajsZ4U5GZ
	BodDzXxCbuRQyqLL3JeJHhwmm/c1kVj3pmP9SZ0v39c1EflpLc10oEFTv7/lE8pfLjc=
X-Gm-Gg: ASbGncuRNsPtmzdWPGaYG22S1M/+Z/q9g3M5k6V3dlhREyPIvQyvJ1BXvIavVZL4RE3
	iIJsFo2jNJ78OVRXdoG5NdqSR4Kc5gcQlEJA1d02ODn9WUk/tHcukixuLkaq/urMGdX+KwREMA/
	uK+wvZFAWg/WkDDsU0gwnrgKWvbeio0dChYdxkNTBpYDdMgj9se4V/0OHlcTymNdubFZn/vTRuG
	aRvfoyXxHmH6GYEQCVUvGnNaDdAf7S8Ci9EA6GifSVx145PxVzdIpjnZy/khYpsr+vfNHRxhO2a
	xirKZDum1Td2wvYhSWaedTuWLurjF1IM/HUucj1qFG7o0Jq52C+JyHQfEfgq5PGU23Uukto1ZHb
	RTaz/xqqVXlnaqb9vrHpALntpKL35Li0ymO1tXBdRoY2F2xJo7w==
X-Google-Smtp-Source: AGHT+IGtoPxWfQ+wEpGjs7bUDWFQ1oeDB2sB8phuc/KoP2/+fvLeJ4l89nxhivkNTcUZ5qQxIwrrZw==
X-Received: by 2002:a5d:64e1:0:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b768f079a1mr5008877f8f.46.1753341651795;
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:871b:95ed:fb39:f517])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d32dsm1253844f8f.24.2025.07.24.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	joe@perches.com,
	corbet@lwn.net,
	apw@canonical.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] checkpatch: validate commit tag ordering
Date: Thu, 24 Jul 2025 09:20:32 +0200
Message-ID: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modified the checkpatch script to ensure that commit tags (e.g.,
Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
correct order according to kernel conventions [1].

checkpatch.pl will now emit a BAD_TAG_ORDER warning when tags are out of
the expected sequence. Multiple tags of the same type are allowed, but
they must also follow the order. 'Link:' tags in the changelog are still
allowed before the tag sequence begins, but once the sequence has started,
any 'Link:' tags must follow the ordered commit tags. 

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags # [1]

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/dev-tools/checkpatch.rst |  6 ++++
 scripts/checkpatch.pl                  | 40 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 76bd0ddb0041..696b42bf4ff5 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -599,6 +599,12 @@ Commit message
 
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
 
+  **BAD_TAG_ORDER**
+    The tags in the commit message are not in the correct order according to
+    community conventions. Common tags like Signed-off-by, Reviewed-by,
+    Tested-by, Acked-by, Fixes, Cc, etc., should follow a standardized sequence.
+
+    See: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags
 
 Comparison style
 ----------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..267ec02de9ec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -661,6 +661,24 @@ foreach my $entry (@link_tags) {
 }
 $link_tags_search = "(?:${link_tags_search})";
 
+# Ordered commit tags
+our @commit_tags = (
+	"Fixes:",
+	"Reported-by:",
+	"Closes:",
+	"Originally-by:",
+	"Suggested-by:",
+	"Co-developed-by:",
+	"Signed-off-by:",
+	"Tested-by:",
+	"Reviewed-by",
+	"Acked-by:",
+	"Cc:",
+	"Link:"
+);
+our $commit_tag_pattern = join '|', map { quotemeta($_) } @commit_tags;
+our $commit_tags_regex = qr{(?xi: ^\s*($commit_tag_pattern))};
+
 our $tracing_logging_tags = qr{(?xi:
 	[=-]*> |
 	<[=-]* |
@@ -2712,6 +2730,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	my $last_matched_tag;
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -3258,6 +3278,26 @@ sub process {
 			}
 		}
 
+# Check commit tags sorting
+		if (!$in_header_lines && $line =~ $commit_tags_regex) {
+			my $tag = $1;
+			my ($tag_index) = grep { lc($commit_tags[$_]) eq lc($tag) } 0..$#commit_tags;
+
+			if ($last_matched_tag &&
+			    $last_matched_tag->{tag_index} > $tag_index) {
+				WARN("BAD_TAG_ORDER",
+				     "Tag '$tag' is out of order. Should come before '$last_matched_tag->{tag}'\n" . $herecurr);
+			}
+
+			# Allow link tags to occur before the commit tags
+			if (lc($tag) ne "link:" || defined $last_matched_tag) {
+				$last_matched_tag = {
+					tag       => $tag,
+					tag_index => $tag_index,
+				};
+			}
+		}
+
 # Check email subject for common tools that don't need to be mentioned
 		if ($in_header_lines &&
 		    $line =~ /^Subject:.*\b(?:checkpatch|sparse|smatch)\b[^:]/i) {
-- 
2.43.0

