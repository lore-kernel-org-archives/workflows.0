Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951441DDFD
	for <workflows@vger.kernel.org>; Fri, 24 Jul 2026 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919372; cv=none; b=Yy/nnvUeunks0mSeqpdOEu4mzLd+SDcAX1lI08+e00lyWtGX0RoX+0e1hbyhsaXLWKhxr8T2rP0tRBmSikvY+Qt3x0JHjqssRD3e+NJXUAinevqcEa9ozyvus7Fz/gBN4YA0bF23w8Umw2FdISvW75VbYfNA4lVsDC9GNfa9HuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919372; c=relaxed/simple;
	bh=c9V0sfqfFxdMg9bjVLruyv8TQk5h66sNRxq7jaYnBb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QLkmX+zeU5TsjyUC0h+tbTQNYOxDCrNz3hBe1IogPFIQqPYl5dL6gFVycfSW5AKsEIvYJ67n7pJEqPUI9/USrGDXmdI1eqkqBmXanctyDBTNk+bkVFEolXaGEIVCnI0tcCA1A1c/iB4zJ9MrV1PY1J6H0N3+W36LW+JFmV0CH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyISXkki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4lG925L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyISXkki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4lG925L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqW0N3779941
	for <workflows@vger.kernel.org>; Fri, 24 Jul 2026 18:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uhVhlXkCOsR0F6ccRTyc8u
	L2BKxnxpaMtXK7jOWCioU=; b=NyISXkkiFYUpI3Vc+ZGSDJ4IU/UK47CbiGZcHk
	/UxoBESD8ZvMyqE3wvMjQ3R5z5/KebJG9PaeDfdk4e4KC5/nbFWRVpM6ybvdGoO8
	arpHUm4OG3FHHn5IWVZoV3eWMgainaRnHSCkybytzJBF6xXqWel5A6rd6XITTqaG
	2D/gBReYEJBahh4N+qsvyB+rSCDeVajHNu5lkFdkMc9wtxtAiSugUAHIhHCPSekU
	o8Er4f8iD3zsS8ria4NgFmB+Az5BBzbRHYX4aTWbSW/fmv+XjDL2qtZPTn+SkYeW
	MQLlGXPUwbfxjxqm/67vkG6VmdXYVfISHaMomPH2Mmhw4XjQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byt348-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Fri, 24 Jul 2026 18:56:08 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e99ff505c2so356837a34.1
        for <workflows@vger.kernel.org>; Fri, 24 Jul 2026 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784919368; x=1785524168; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uhVhlXkCOsR0F6ccRTyc8uL2BKxnxpaMtXK7jOWCioU=;
        b=B4lG925LbGjP1ZuqQMrH0BTJ6Kihlj2R0+0MffRvxd6hD90HWdm8Eroy8Pi8T9iDvN
         +AZ3rB39PkNcH6yEXF165GkAKka5syIET9r7WeQWCI4hqh8Z4fcafKh7GVPS+mWArb5s
         FJ7FA/TWqUMau101rl57ijvf2MwRBgGMFqoI3DGDacW/gIt2Yt/6cBPe0Rr7wdNKJRCv
         rhLKwrZWPHhPqJPSNzMdHySoi74PwS+3ZmdtH+8ZvB5FLY7Nfqwp0HOevrGI4lUPcpRN
         EYbMXkkMoXkWD2NlJsQb//BHSMollx7AbnvdnMhwMuZayjQzyFicAGxe8SUMoEyvHTxE
         A0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784919368; x=1785524168;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uhVhlXkCOsR0F6ccRTyc8uL2BKxnxpaMtXK7jOWCioU=;
        b=GSUtu1v7JZ0H8aFoMZfhKXyaCQYvYM19rOiqncSHsCwZ+kgn/ty4TPlS0i8kD20615
         Clk9335a9YtToBs4GkCM+Yibvr2HFmYfhhJMZizZCMCXZFT4LqmV78WVOAK4olVENwzP
         5xty8QNi3qVIlHmO4K1kG87h/PkRDJgeEV0lsTAve+PiHKL0e7/eLnJRUy3MR4zDmPII
         G4/GQh8DvI1B6ZHv5uFrE9dGX0tFyHXVPPlvY6QqE+mOURS7X8l4vjxVC/r5PEo1IDqY
         5Q3uVPc+m0hWlZ5Ae++YnjcLrSoMgjnZyEgPbU5VDRIN+z8ptN+ZJ9FzN0vmTJpkjOL+
         XwnA==
X-Forwarded-Encrypted: i=1; AHgh+RoJWyVn6wbUiU4XUi8nw/xzQFs8/C9aOPitS99VRk2k7/Hs7VZj3y3p4xvlrJ7vQ1dBzP1NNF8l3/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTKE/Vds9P4AdPwvPDgba+7QiwSAoNx53NZx5sxDKm/q3jcgP
	eXFCjgUVUs/GPXsAFTKOsfMpg30iW1+QVHA6LMXXgGrW/z6VJUzMI6LDNI8ARevRUCeaqfJzESZ
	UigfVAOPcz3V5/jEETt45Z3mraawa9r8EEKVgMBP8yqflWRmO9XluiIfzCbGqySU=
X-Gm-Gg: AR+sD10WlYG1i37m40bKogtXic+GppJ7eopH6OTdGTx0O5877XnoxDbKaNQ9/sVnc4G
	ZIwudBlDI4b2pyaJBA8DRH90+uJAJr82ya+1g8W2DqHJKsDthXAOy3OQvkoy5pSyIwcQ24JQK2p
	uk7t3ndjAhptR/iJBceMZfeeF5UghX8ONLXmSIHVuwoLQdqg2qZd7u02U7WhrNrrkk9CvpPytkJ
	PCTHNk2gQX7Pi+luKmD01NPiHGoWMtJT0SBK0SI+FSH+uzrPJ0q0ya/AWGNa6eFLUyhvP/7VaYr
	X3Nm/pdKEsOb3TEYe5Y2yo2ACFvIVUTJWnLynFVmNsmIYeE7tU61IUGlplANyPouP+GsxI4bfhK
	8QdBievA6Y60O9K0pPoc=
X-Received: by 2002:a05:6820:208a:b0:6a1:4040:97c1 with SMTP id 006d021491bc7-6aad4161879mr5027162eaf.56.1784919367665;
        Fri, 24 Jul 2026 11:56:07 -0700 (PDT)
X-Received: by 2002:a05:6820:208a:b0:6a1:4040:97c1 with SMTP id 006d021491bc7-6aad4161879mr5027143eaf.56.1784919367204;
        Fri, 24 Jul 2026 11:56:07 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf8e99ff5sm559583eaf.0.2026.07.24.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:56:06 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:56:00 +0000
Subject: [PATCH] checkpatch: Validate committer sign-off
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD+1Y2oC/yXMQQrCMBBA0auUWTuQJiWCVxEXzWRqRmlTMlGE0
 rsb6/It/t9AuQgrXLoNCr9FJS8N/akDSuNyZ5TYDNZYb87WISWm5zpWSkh5nqVWLqg5YG8mCtE
 7HwcHLV8LT/I51tfb3/oKD6b6+8G+fwHD3giofAAAAA==
X-Change-ID: 20260723-checkpatch-committer-sob-10fcbd636d43
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>
Cc: linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7213;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=c9V0sfqfFxdMg9bjVLruyv8TQk5h66sNRxq7jaYnBb8=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqY7VFceFBjfIxK8PPdsO40gVQtS5n8/i/s19Or
 dGpgShB69WJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamO1RQ4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxVcmEACEmQv4L9lQ0G4F7wheIs5mP7TeG3QjQZ9JrnVuBz47sIxPAiB
 OaFnjIz/ET16IZ6KDlV7CFixi1QZmVI4aRtl3pl8pTPc5k3DSECh9IGi7qTpaJpNj07/k9tZmCP
 ofOtIcg/N5k4RUEV7tZYcEr9PeKSO3KfRZstCadYJ5YeBxcRBJMCa1Sfazd1wExGK2THmQb9ksS
 nT7i5C33WXWoHpYdL1k1oRvCpzg+MJLntmNoh78lFgOyJHQD26Ji3jBUAwylFSok9vvC81ozpqV
 ZlwD4/IJloKkExirgOJGzfUNeaefjOI6kc5xb2F03UbU/cB6mDsfaDj3SXckUj84yUojuzOyWCP
 qtefbSLEEhJEFe6OYgLdxE2b5G+IWBDDLd/yBUlydnkuNp00lq7X3tbySaL5DESLdz690tekv8U
 ksqXqbZVhqw6yNpDVQcHi2hJTqzgmTydksWBUl9vJOyg94C+lZnHkR4tRqxucEYIF4SroGscUIE
 YP08UGnZi7lZ5hTLH2QdQi5xBZ2TTnzI7BWjud/w2E4itRO7Q/mUqlw6UaGIvfhlTdRiUy5sQS+
 6G0sAOKC1tySnhU2Whah78Rd3wHnQ18ZuBE5HUirAU/dji8S0UrG34ybz8g6LYt8Np4lI5VMyXw
 18i58OcSubA++ZK3EV+MKin7BUUbIPZm48w==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: PwOqRAXglseCikUBQgUA7mZE1N8A8MyX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE3MCBTYWx0ZWRfX75aQTT1ozTVW
 QiR02ZWXe4Yuh0O/tV3ILxvA3kSS8bOS/140j8lAAtxLphx3u5QC818rRmKZyNDzi9jcR6rvrsz
 yVWJBkRZKg9XZyQ+tcJj/ELNF0U7Mfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE3MCBTYWx0ZWRfXzKcjI8VJanlK
 M/t1bUilZPmIK7/AK/Og4U2D4N7njH5jzTdsYivXHz3fr8rfPgK6F4Tu1HpZWfZe2sFAfO4SMRl
 flWcDVy31YuRbFbGX04ED2b+PfbAoQTI8kEZVjEQo49TLehiECr1x2v/KWKNGnyN00SJ+abn6CH
 RO/M6OP4TxXJa8OrSxZVHrlWkG4HmPf01ywjXVHgj3CB/32/O+QhGWCqKNlAA62/4I5uwAFEvqj
 t4tKHpwEO9SegBDLcjuaUGHOxF3LlgzCptH8kokFAtY29GrfDKfbzSAvYPS57kl1IAxq2fnjgdr
 7oWTX1F5jCUzwM0dksDSGzkgpi0LAJknbi/gW7Y8qmTSr7qCBgmyiAxPLenlgcNvZGbgQPf0lAc
 FxzCZciDqCqCfWTX9F6lGXxOwOYHFGp6G1zMzscG09iua5ylRZWJ3NY7AluqveeKlgqEqKC5qnX
 VRHK8u5D8uadJ8skKsQ==
X-Proofpoint-GUID: PwOqRAXglseCikUBQgUA7mZE1N8A8MyX
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a63b548 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CCtDUpZfQFSzZZKND2oA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240170

checkpatch validates the Signed-off-by trailers against the patch's
author, but misses the opportunity to also validate the committer when
run with --git. Maintainers therefor need third-party scripts for the
final Signed-off-by check.

git format-patch provides the author and patch content, but not the
committer. Extend the existing git log extraction to record the
committer identity.

Extract the author sign-off comparison logic into a shared helper, and
use it to apply the same heuristics to the final Signed-off-by trailer
and committer.

Emit COMMITTER_SIGN_OFF_MISMATCH when the final trailer does not match
the committer.

Assisted-by: OpenCode:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/dev-tools/checkpatch.rst |   5 ++
 scripts/checkpatch.pl                  | 112 ++++++++++++++++++++++-----------
 2 files changed, 82 insertions(+), 35 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 6139a08c34cd..7726c3863bcc 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -562,6 +562,11 @@ Commit message
       - The email subaddresses do not match.
       - The email comments do not match.
 
+  **COMMITTER_SIGN_OFF_MISMATCH**
+    When checking a Git commit, the final Signed-off-by: line does not match
+    the commit's committer.  The person committing a patch should add their
+    own Signed-off-by: line last.
+
   **MISSING_SIGN_OFF**
     The patch is missing a Signed-off-by line.  A signed-off-by
     line should be added according to Developer's certificate of
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7a846a3ea127..0e1bff241597 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -37,6 +37,7 @@ my $showfile = 0;
 my $file = 0;
 my $git = 0;
 my %git_commits = ();
+my %git_committers = ();
 my $check = 0;
 my $check_orig = 0;
 my $summary = 1;
@@ -1317,14 +1318,16 @@ if ($git) {
 		} else {
 			$git_range = "-1 $commit_expr";
 		}
-		my $lines = `${git_command} log --no-color --no-merges --pretty=format:'%H %s' $git_range`;
+		my $lines = `${git_command} log --no-color --no-merges --pretty=format:'%cn <%ce> %H %s' $git_range`;
 		foreach my $line (split(/\n/, $lines)) {
-			$line =~ /^([0-9a-fA-F]{40,40}) (.*)$/;
-			next if (!defined($1) || !defined($2));
-			my $sha1 = $1;
-			my $subject = $2;
+			$line =~ /^(.* <[^>]+>) ([0-9a-fA-F]{40,40}) (.*)$/;
+			next if (!defined($1) || !defined($2) || !defined($3));
+			my $committer = $1;
+			my $sha1 = $2;
+			my $subject = $3;
 			unshift(@commits, $sha1);
 			$git_commits{$sha1} = $subject;
+			$git_committers{$sha1} = $committer;
 		}
 	}
 	die "$P: no git commits after extraction!\n" if (@commits == 0);
@@ -1530,6 +1533,43 @@ sub same_email_addresses {
 	       $comment1 eq $comment2;
 }
 
+sub signoff_match_status {
+	my ($signoff, $identity) = @_;
+	my $authorsignoff = 0;
+
+	if (same_email_addresses($signoff, $identity)) {
+		$authorsignoff = 1;
+	} else {
+		my ($signoff_name, $signoff_comment, $signoff_address, $comment1) = parse_email($signoff);
+		my ($identity_name, $identity_comment, $identity_address, $comment2) = parse_email($identity);
+
+		if (lc $signoff_address eq lc $identity_address &&
+		    $signoff_name eq $identity_name) {
+			$authorsignoff = 2;
+		} elsif (lc $signoff_address eq lc $identity_address) {
+			$authorsignoff = 3;
+		} elsif ($signoff_name eq $identity_name) {
+			$authorsignoff = 4;
+
+			my $address1 = $signoff_address;
+			my $address2 = $identity_address;
+
+			if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
+				$address1 = "$1$2";
+			}
+			if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
+				$address2 = "$1$2";
+			}
+
+			if ($address1 eq $address2) {
+				$authorsignoff = 5;
+			}
+		}
+	}
+
+	return $authorsignoff;
+}
+
 sub which {
 	my ($bin) = @_;
 
@@ -2690,6 +2730,9 @@ sub process {
 	my $author = '';
 	my $authorsignoff = 0;
 	my $author_sob = '';
+	my $last_signoff = '';
+	my $committer = $git_committers{$filename} // '';
+	my $committersignoff = 0;
 	my $is_patch = 0;
 	my $is_binding_patch = -1;
 	my $in_header_lines = $file ? 0 : 1;
@@ -3018,40 +3061,16 @@ sub process {
 # Check the patch for a signoff:
 		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
 			$signoff++;
+			$last_signoff = $1;
 			$in_commit_log = 0;
 			if ($author ne ''  && $authorsignoff != 1) {
-				if (same_email_addresses($1, $author)) {
-					$authorsignoff = 1;
-				} else {
-					my $ctx = $1;
-					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
-					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
-
-					if (lc $email_address eq lc $author_address && $email_name eq $author_name) {
-						$author_sob = $ctx;
-						$authorsignoff = 2;
-					} elsif (lc $email_address eq lc $author_address) {
-						$author_sob = $ctx;
-						$authorsignoff = 3;
-					} elsif ($email_name eq $author_name) {
-						$author_sob = $ctx;
-						$authorsignoff = 4;
-
-						my $address1 = $email_address;
-						my $address2 = $author_address;
-
-						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
-							$address1 = "$1$2";
-						}
-						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
-							$address2 = "$1$2";
-						}
-						if ($address1 eq $address2) {
-							$authorsignoff = 5;
-						}
-					}
+				my $signoff_status = signoff_match_status($1, $author);
+				if ($signoff_status != 0) {
+					$authorsignoff = $signoff_status;
+					$author_sob = $1 if ($signoff_status != 1);
 				}
 			}
+			$committersignoff = signoff_match_status($1, $committer) if ($committer ne '');
 		}
 
 # Check for invalid patch separator
@@ -7901,6 +7920,29 @@ sub process {
 			}
 		}
 	}
+	if ($is_patch && $has_commit_log && $chk_signoff &&
+	    $committer ne '' &&
+	    $last_signoff ne '' &&
+	    $committersignoff != 1) {
+		my $sob_msg = "'Committer: $committer' != 'Signed-off-by: $last_signoff'";
+
+		if ($committersignoff == 2) {
+			CHK("COMMITTER_SIGN_OFF_MISMATCH",
+			    "Committer:/Signed-off-by: email comments mismatch: $sob_msg\n");
+		} elsif ($committersignoff == 3) {
+			WARN("COMMITTER_SIGN_OFF_MISMATCH",
+			     "Committer:/Signed-off-by: email name mismatch: $sob_msg\n");
+		} elsif ($committersignoff == 4) {
+			WARN("COMMITTER_SIGN_OFF_MISMATCH",
+			     "Committer:/Signed-off-by: email address mismatch: $sob_msg\n");
+		} elsif ($committersignoff == 5) {
+			WARN("COMMITTER_SIGN_OFF_MISMATCH",
+			     "Committer:/Signed-off-by: email subaddress mismatch: $sob_msg\n");
+		} else {
+			WARN("COMMITTER_SIGN_OFF_MISMATCH",
+			     "Last Signed-off-by: '$last_signoff' != commit committer '$committer'\n");
+		}
+	}
 
 	print report_dump();
 	if ($summary && !($clean == 1 && $quiet == 1)) {

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-checkpatch-committer-sob-10fcbd636d43

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

