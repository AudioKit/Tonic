
// CoreGraphics is not available on Linux.
#if os(macOS) || os(iOS)
import CoreGraphics

/// Pitch represented as color.
///
/// Source: http://theappendix.net/posts/2013/08/music-and-color-the-french-connection
public struct PitchColor {

    /// Pitch represented as color by Sir Isaac Newton 1704 and filled in by D.D. James 1844
    public static var newtonian: [CGColor] {
        PitchColor.jameson
    }

    /// Pitch represented as color by Sir Isaac Newton 1704 and filled in by D.D. James 1844
    public static var jameson: [CGColor] {
        [#colorLiteral(red: 0.8941176470588236,  green: 0.20784313725490197,  blue: 0.14901960784313725,  alpha: 1.0), #colorLiteral(red: 0.8823529411764706,  green: 0.33725490196078434,  blue: 0.17647058823529413,  alpha: 1.0), #colorLiteral(red: 0.9058823529411765,  green: 0.5254901960784314,   blue: 0.20784313725490197,  alpha: 1.0), #colorLiteral(red: 0.9372549019607843,  green: 0.8274509803921568,   blue: 0.35294117647058826,  alpha: 1.0), #colorLiteral(red: 0.9607843137254902,  green: 0.9568627450980393,   blue: 0.3843137254901961,   alpha: 1.0), #colorLiteral(red: 0.25882352941176473, green: 0.5529411764705883,   blue: 0.2549019607843137,   alpha: 1.0), #colorLiteral(red: 0.2627450980392157,  green: 0.5529411764705883,   blue: 0.5019607843137255,   alpha: 1.0), #colorLiteral(red: 0.10196078431372549, green: 0.054901960784313725, blue: 0.49411764705882355,  alpha: 1.0), #colorLiteral(red: 0.26666666666666666, green: 0.0784313725490196,   blue: 0.47058823529411764,  alpha: 1.0), #colorLiteral(red: 0.4549019607843137,  green: 0.09411764705882353,  blue: 0.47058823529411764,  alpha: 1.0), #colorLiteral(red: 0.592156862745098,   green: 0.14901960784313725,  blue: 0.5137254901960784,   alpha: 1.0), #colorLiteral(red: 0.7725490196078432,  green: 0.18823529411764706,  blue: 0.5058823529411764,   alpha: 1.0)]
    }

    /// H. von Helmholtz 1910
    public static var helmholtz: [CGColor] {
        [#colorLiteral(red: 0.9559110999, green: 0.9574406743, blue: 0.2271825373, alpha: 1), #colorLiteral(red: 0.09168647975, green: 0.5614684224, blue: 0.2035461664, alpha: 1), #colorLiteral(red: 0.107751824, green: 0.561155498, blue: 0.5053380132, alpha: 1), #colorLiteral(red: 0.1154829487, green: 0.3573897481, blue: 0.6315132976, alpha: 1), #colorLiteral(red: 0.4977235794, green: 0.02578645572, blue: 0.4828269482, alpha: 1), #colorLiteral(red: 0.8373373151, green: 0.07364030927, blue: 0.5232784152, alpha: 1), #colorLiteral(red: 0.6119022965, green: 0.05432644486, blue: 0.3332355618, alpha: 1), #colorLiteral(red: 0.9776715636, green: 0.05728369206, blue: 0.02724142745, alpha: 1), #colorLiteral(red: 0.8220232725, green: 0.1718403697, blue: 0.04526854306, alpha: 1), #colorLiteral(red: 0.8263251185, green: 0.1708699465, blue: 0.03276873752, alpha: 1), #colorLiteral(red: 0.9626845717, green: 0.1791820824, blue: 0.03756467998, alpha: 1), #colorLiteral(red: 0.9502773881, green: 0.4768713713, blue: 0.05336604267, alpha: 1)]
    }

    /// Alexander Scriabin 1911
    public static var scriabin: [CGColor] {
        [#colorLiteral(red: 0.9779261947, green: 0.0260898713, blue: 0.0297838375, alpha: 1), #colorLiteral(red: 0.8417600989, green: 0.06093677133, blue: 0.5232403874, alpha: 1), #colorLiteral(red: 0.9567921758, green: 0.9533532262, blue: 0.229016453, alpha: 1), #colorLiteral(red: 0.3521543443, green: 0.3363839984, blue: 0.5271323919, alpha: 1), #colorLiteral(red: 0.1076103374, green: 0.3574647307, blue: 0.6315308213, alpha: 1), #colorLiteral(red: 0.6203066111, green: 0.05192982405, blue: 0.03417751566, alpha: 1), #colorLiteral(red: 0.1086612418, green: 0.04914004356, blue: 0.5073096752, alpha: 1), #colorLiteral(red: 0.9703311324, green: 0.4968493581, blue: 0.05857385695, alpha: 1), #colorLiteral(red: 0.4975798726, green: 0.03369900584, blue: 0.4827746749, alpha: 1), #colorLiteral(red: 0.08501193672, green: 0.5654773116, blue: 0.2079677582, alpha: 1), #colorLiteral(red: 0.3560432196, green: 0.3403272927, blue: 0.522734046, alpha: 1), #colorLiteral(red: 0.1125000641, green: 0.3614059687, blue: 0.6354993582, alpha: 1)]
    }

    /// Adrian Bernard Klein 1930
    public static var klein: [CGColor] {
        [#colorLiteral(red: 0.7693940997, green: 0.04123102129, blue: 0.03680998832, alpha: 1), #colorLiteral(red: 0.9820852876, green: 0.03855920956, blue: 0.03907435015, alpha: 1), #colorLiteral(red: 0.9504275918, green: 0.2801913917, blue: 0.06884595007, alpha: 1), #colorLiteral(red: 0.965927422, green: 0.4972035289, blue: 0.06009680778, alpha: 1), #colorLiteral(red: 0.9567921758, green: 0.9533532262, blue: 0.229016453, alpha: 1), #colorLiteral(red: 0.7373097539, green: 0.8751418591, blue: 0.2249842286, alpha: 1), #colorLiteral(red: 0.07658796757, green: 0.5615321398, blue: 0.2036482394, alpha: 1), #colorLiteral(red: 0.1076945439, green: 0.5611609817, blue: 0.5010221004, alpha: 1), #colorLiteral(red: 0.1081966832, green: 0.05347197503, blue: 0.5113616586, alpha: 1), #colorLiteral(red: 0.474837482, green: 0.0926971212, blue: 0.5238884687, alpha: 1), #colorLiteral(red: 0.8373426795, green: 0.07359044999, blue: 0.5274857879, alpha: 1), #colorLiteral(red: 0.6161900163, green: 0.05246809125, blue: 0.3330878019, alpha: 1)]
    }

    /// Steve Zieverink 2004
    public static var zieverink: [CGColor] {
        [#colorLiteral(red: 0.7362077236, green: 0.8792037368, blue: 0.2233240306, alpha: 1), #colorLiteral(red: 0.09165825695, green: 0.5614706874, blue: 0.1980602741, alpha: 1), #colorLiteral(red: 0.1076945439, green: 0.5611609817, blue: 0.5010221004, alpha: 1), #colorLiteral(red: 0.1081418023, green: 0.05353103578, blue: 0.5072774887, alpha: 1), #colorLiteral(red: 0.4977235794, green: 0.02578645572, blue: 0.4828269482, alpha: 1), #colorLiteral(red: 0.8373426795, green: 0.07359044999, blue: 0.5274857879, alpha: 1), #colorLiteral(red: 0.4373093247, green: 0.04991041869, blue: 0.2720754147, alpha: 1), #colorLiteral(red: 0.6288832426, green: 0.04795408994, blue: 0.03198715672, alpha: 1), #colorLiteral(red: 0.9820852876, green: 0.03855920956, blue: 0.03907435015, alpha: 1), #colorLiteral(red: 0.965927422, green: 0.4972035289, blue: 0.06009680778, alpha: 1), #colorLiteral(red: 0.9260447621, green: 0.9420893192, blue: 0.531943202, alpha: 1), #colorLiteral(red: 0.9519914985, green: 0.9535178542, blue: 0.221549809, alpha: 1)]
    }

}
#endif
